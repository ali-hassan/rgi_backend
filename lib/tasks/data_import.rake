# frozen_string_literal: true

require 'csv'

namespace :sectors do
  desc 'Imports countries and sectors from a csv'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'sectors.csv'))

    puts '* Loading Sectors... *'
    Sector.transaction do
      CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
        data_row = row.to_h

        country_name = data_row['Country']
        country_iso = data_row['ISO']
        sector_name = data_row['M'] == '1' ? 'mining' : 'oil-gas'

        sector = Sector.find_by(name: sector_name)
        country = Country.where(name: country_name, iso: country_iso).first_or_create
        cs = CountrySector.where(country_id: country.id, sector_id: sector.id).first_or_create
        cs.save(validate: false)
      end
    end
    puts 'Finished importing countries and sectors'
  end
end

namespace :framework do
  desc 'Import the global framework data'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'framework.csv'))
    puts '* Loading framework... *'

    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      next if data_row['Type'] == 'COMPOSITE'
      if data_row['Type'] == 'COMPONENT'
        category_name = data_row['Element name']
        @category = Category.find_or_create_by name: category_name
        @category.update_columns position: data_row['Number']
        puts "..Creating category #{category_name}"
        next
      end
      if data_row['Type'] == 'SUB-COMPONENT'
        subcategory_name = data_row['Element name']
        @subcategory = Subcategory.where(category_id: @category.id, name: subcategory_name).first_or_create!
        @subcategory.update_columns position: data_row['Number']
        puts "....Creating subcategory #{subcategory_name}"
        next
      end
      if data_row['Type'] == 'INDICATOR'
        indicator_name = data_row['Element name']
        @indicator = Indicator.where(subcategory_id: @subcategory.id, name: indicator_name).first_or_create!
        @indicator.update_columns position: data_row['Number']
        puts "......Creating indicator #{indicator_name}"
        next
      end
      if data_row['Type'] == 'QUESTION'
        question_description = data_row['Question']
        question_name = data_row['Question label']
        question_number = data_row['Number']
        @question = Question.where(number: question_number, indicator_id: @indicator.id).first_or_create!
        @question.update_columns name: question_name, description: question_description, number: question_number

        answer_types = { 'A' => 'ZERO (A)', 'B' => 'ONE (B)', 'C' => 'TWO (C)',
                         'D' => 'THREE (D)', 'E' => 'FOUR (E)', 'F' => 'FIVE (F)', 'G' => 'SIX (G)'}
        answer_types.each do |answer_hash|
          answer_name = data_row[answer_hash[1]]
          if answer_name.present?
            answer_value = data_row["SCORE_PARAM_#{answer_hash[0]}"]
            answer = Answer.where(question_id: @question.id, value_string: answer_hash[0]).first_or_create!
            answer_value = nil if answer_value.eql?('.')
            answer.update_columns name: answer_name, value_number: answer_value
          end
        end
        next
      end
    end
  end
end

namespace :results do
  desc 'Import the global framework data'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'results.csv'))
    puts '* Loading results... *'

    HEADER_TYPE = 0
    HEADER_ELEMENT = 1
    MAIN_HEADER = 2
    START_ROW = 3
    COUNTRY_COLUMN = 0
    ISO_COLUMN = 1
    MINING_COLUMN = 2
    START_COLUMN = 4

    # Getting headers
    file = File.new(filename)
    csv = CSV.read (file)

    csv[START_ROW..-1].each do |row|
      country_iso = row[ISO_COLUMN]
      sector_name = row[MINING_COLUMN] == '1' ? 'mining' : 'oil-gas'
      country = Country.find_by(iso: country_iso)
      sector = Sector.find_by(name: sector_name)
      cs = CountrySector.find_by(country_id: country.id, sector_id: sector.id)

      puts "Starting country #{country_iso} and sector #{sector_name}"

      jump = false
      row[START_COLUMN..-1].each_with_index do |element, i|
        #puts "#{csv[HEADER_ELEMENT][START_COLUMN + i].to_s} #{i}"

        if jump
          jump = false
          next
        end
        case csv[HEADER_TYPE][START_COLUMN + i]
        when 'COMPOSITE'
          jump = true
          cs.score = element
          cs.rank = row[START_COLUMN + i + 1] if row[START_COLUMN + i + 1].present? && row[START_COLUMN + i + 1] != '.'
          cs.save!(validate: false)

        when 'COMPONENT'
          jump = true
          category = Category.find_by(name: csv[HEADER_ELEMENT][START_COLUMN + i])
          csc = CountrySectorCategory.where(country_sector_id: cs.id, category_id: category.id).first_or_create
          csc.score = element if element.present? && element != '.'
          csc.rank = row[START_COLUMN + i + 1] if row[START_COLUMN + i + 1].present? && row[START_COLUMN + i + 1] != '.'
          csc.save!(validate: false)

        when 'SUB-COMPONENT'
          jump = true
          subcategory = Subcategory.find_by(name: csv[HEADER_ELEMENT][START_COLUMN + i])
          cssc = CountrySectorSubcategory.where(country_sector_id: cs.id, subcategory_id: subcategory.id).first_or_create
          cssc.score = element if element.present? && element != '.'
          cssc.rank = row[START_COLUMN + i + 1] if row[START_COLUMN + i + 1].present? && row[START_COLUMN + i + 1] != '.'
          cssc.save!(validate: false)

        when 'INDICATOR'
          jump = true
          indicator = Indicator.find_by(name: csv[HEADER_ELEMENT][START_COLUMN + i])
          csi = CountrySectorIndicator.where(country_sector_id: cs.id, indicator_id: indicator.id).first_or_create
          csi.score = element if element.present? && element != '.'
          csi.rank = row[START_COLUMN + i + 1] if row[START_COLUMN + i + 1].present? && row[START_COLUMN + i + 1] != '.'
          csi.save!(validate: false)

        when 'QUESTION'
          question = Question.find_by(number: csv[MAIN_HEADER][START_COLUMN + i])
          csq = CountrySectorQuestion.where(country_sector_id: cs.id, question_id: question.id).first_or_create
          csq.score = element if element.present? && element != '.'
          csq.save!(validate: false)
        end
      end
    end
  end
end

namespace :assessment do
  desc 'Import the data for country sector'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'assessment.csv'))
    puts '* Loading assessments... *'
    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      country_iso = data_row['country iso'].upcase
      sector_name = data_row['sector'] == 'mining' ? 'mining' : 'oil-gas'
      sector = Sector.find_by(name: sector_name)
      country = Country.find_by(iso: country_iso)

      puts "Country #{country_iso} Sector #{sector_name}"

      assessment = CountrySector.find_by(country_id: country.id, sector_id: sector.id)
      assessment.description = data_row['main description']
      assessment.performance_title = data_row['title_performance_highlights']
      assessment.performance_highlights_top = data_row['performance_highlights_text_1']
      assessment.performance_highlights_bottom = data_row['performance_highlights_text_2']
      assessment.graph_type = data_row['optional_graph_type']
      assessment.graph_text = data_row['optional_graph_text']

      # Institutions
      if data_row['special institutions'] == 'TRUE'

        [SpecialInstitutionTitle::FIRST, SpecialInstitutionTitle::SECOND].each_with_index do |type, index|
          i = index + 1
          if data_row["special institutions description #{i}"].present?
            title = data_row["title special institutions #{i}"]
            description = data_row["special institutions description #{i}"]
            si = SpecialInstitution.new(title: title, description: description, institution_type: type)
            assessment.special_institutions << si
          end
        end
      end

      assessment.comparison_title = data_row['comparison title']
      assessment.comparison_description = data_row['comparison description']
      assessment.footnote = data_row['note_on_the_RGI_methodologogy']

      assessment.save!

    end
  end
end

namespace :pl_graphs do
  desc 'Import the data for pl graphs'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'lawandpractice.csv'))
    puts '* Loading law and practice... *'
    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      country_iso = data_row['ISO'].upcase
      sector_name = data_row['M'] == '1' ? 'mining' : 'oil-gas'
      sector = Sector.find_by(name: sector_name)
      country = Country.find_by(iso: country_iso)

      puts "Country #{country_iso} Sector #{sector_name}"
      assessment = CountrySector.find_by(country_id: country.id, sector_id: sector.id)

      pl = PlGraph.where(id: assessment.pl_graph_id).first_or_create
      pl.law = data_row['LAW']
      pl.practice = data_row['PRACTICE']
      pl.gap = data_row['GAP']
      pl.save!
      assessment.update_attribute(:pl_graph_id, pl.id) if assessment.pl_graph_id.nil?
    end
  end
end

namespace :bubble_graphs do
  desc 'Import the data for bubble graphs'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'graph.csv'))
    puts '* Loading bubble graphs... *'
    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      country_iso = data_row['ISO'].upcase
      sector_name = data_row['M'] == '1' ? 'mining' : 'oil-gas'
      sector = Sector.find_by(name: sector_name)
      country = Country.find_by(iso: country_iso)

      puts "Country #{country_iso} Sector #{sector_name}"
      assessment = CountrySector.find_by(country_id: country.id, sector_id: sector.id)

      bubble = BubbleGraph.where(id: assessment.bubble_graph_id).first_or_create

      bubble.x = data_row['x']
      bubble.y = data_row['y']
      bubble.size = data_row['size']
      bubble.color = data_row['color']
      bubble.save!
      assessment.update_attribute(:bubble_graph_id, bubble.id) if assessment.bubble_graph_id.nil?
    end
  end
end

namespace :direction_graphs do
  desc 'Import the data for direction graphs'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'directions.csv'))
    puts '* Loading direction graphs... *'
    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      if data_row['START'] == 'country'
        country_iso = data_row['ISO'].upcase
        sector_name = data_row['TYPE'] == 'M' ? 'mining' : 'oil-gas'
        sector = Sector.find_by(name: sector_name)
        country = Country.find_by(iso: country_iso)

        puts "Country #{country_iso} Sector #{sector_name}"
        @cs = CountrySector.find_by(country_id: country.id, sector_id: sector.id)

      else
        issue = data_row['COUNTRY']
        score = data_row['VALUE']
        direction = data_row['DIRECTION']
        dg = DirectionGraph.where(id: @cs.direction_graph_id).first_or_create
        @cs.update_attribute(:direction_graph_id, dg.id) if @cs.direction_graph_id.nil?
        DirectionScore.create(issue: issue, score: score, direction: direction, direction_graph_id: dg.id)
      end
    end
  end
end

namespace :special do
  desc 'Import the data for the special institutions'
  task import: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'special.csv'))
    puts '* Loading direction graphs... *'
    CSV.foreach(filename, col_sep: ';', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h


      country_iso = data_row['ISO'].upcase
      sector_name = data_row['SECTOR'] == 'M' ? 'mining' : 'oil-gas'
      sector = Sector.find_by(name: sector_name)
      country = Country.find_by(iso: country_iso)

      puts "Country #{country_iso} Sector #{sector_name}"
      if country.sectors.count > 1
        assessment = CountrySector.find_by(country_id: country.id, sector_id: sector.id)
      else
        assessment = country.country_sectors.first
      end

      type = data_row['TYPE']

      si = assessment.special_institutions.where(institution_type: type).first_or_create
      si.name = data_row['NAME SOE']
      si.percentage = data_row['SOL']
      si.revenue_value = data_row['REVENUE'].gsub('.', '') if data_row['REVENUE']
      si.revenue_unit = data_row['UNITS']
      si.score = data_row['SCORE']
      si.rank_1 = data_row['RANK1']
      si.rank_2 = data_row['RANK2']

      si.save!
    end
  end
end



namespace :groups do
  desc 'Import the data for the groups'
  task import: :environment do
    if Group.all.count.zero?
      puts 'Creating regions'
      regions = [
          { name: 'ASIAP', description: 'Asia Pacific' },
          { name: 'EURA', description: 'Eurasia' },
          { name: 'LAC', description: 'Latin America and the Caribbean' },
          { name: 'MENA', description: 'Middle East and North Africa' },
          { name: 'SSA', description: 'Sub-Saharan Africa' },
          { name: 'NA', description: 'North America' },
          { name: 'WE', description: 'West Europe' },
          { name: 'AF', description: 'Africa' }
      ]

      regions.each do |r|
        g = Group.new(name: r[:name], description: r[:description])
        g.save!
      end
      puts 'Created regions'
    end


    filename = File.expand_path(Rails.root.join('db', 'files', 'regions.csv'))
    puts '* Loading regions... *'
    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      country_iso = data_row['ISO'].upcase
      country = Country.find_by(iso: country_iso)

      [1, 2].each do |i|
        if data_row["REGION #{i}"].present?
          r = Group.find_by(name: data_row["REGION #{i}"])
          r.countries << country
          r.save!
        end
      end
    end
  end
end


namespace :all do
  desc 'Import all the data'
  task import: :environment do
    Rake::Task['sectors:import'].execute
    Rake::Task['framework:import'].execute
    Rake::Task['results:import'].execute
    Rake::Task['data:fill'].execute
    Rake::Task['assessment:import'].execute
    Rake::Task['special:import'].execute
    Rake::Task['pl_graphs:import'].execute
    Rake::Task['bubble_graphs:import'].execute
    Rake::Task['direction_graphs:import'].execute
    Rake::Task['groups:import'].execute
    Rake::Task['calc:all'].execute
  end
end