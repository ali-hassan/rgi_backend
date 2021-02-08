namespace :data do
  desc 'Import the global framework data'
  task fill: :environment do
    puts 'Filling Subcategories'
    CountrySectorSubcategory.find_each do |csc|
      puts "#{csc.id}"
      id = CountrySectorCategory.find_by(country_sector_id: csc.country_sector_id, category_id: csc.subcategory.category_id).id
      csc.country_sector_category_id =  id
      csc.save!(validate: false)
    end

    puts 'Filling Indicators'
    CountrySectorIndicator.find_each do |csi|
      id = CountrySectorSubcategory.find_by(country_sector_id: csi.country_sector_id, subcategory_id: csi.indicator.subcategory_id).id
      csi.country_sector_subcategory_id = id
      csi.save!(validate: false)
    end

    puts 'Updating Questions'
    CountrySectorQuestion.find_each do |csq|
      id = CountrySectorIndicator.find_by(country_sector_id: csq.country_sector_id, indicator_id: csq.question.indicator_id).id
      csq.country_sector_indicator_id = id
      csq.save!(validate: false)
    end
  end
end