# frozen_string_literal: true
ActiveAdmin.register CountrySectorQuestion do
  menu parent: 'Results', priority: 3, label: 'Questions'
  belongs_to :country_sector, optional: true

  permit_params :country_sector_id, :question_id, :score, :rank

  sidebar 'Answer', only: :show do
    attributes_table_for resource do
      answer = Answer.find_by(question_id: resource.question_id, value_number: resource.score)
      if answer
        h4 link_to(answer.name, answer_path(answer.id))
      end
    end
  end

  index do
    column :country_sector do |cs|
      "#{cs.country_sector.country.name}, #{cs.country_sector.sector.name}"
    end
    column :question
    column :score
    column :rank
    column :updated_at
    actions
  end

  filter :country_sector, as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
  filter :question
  filter :score
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Sector Question Details' do
      f.input :country_sector_id, label: 'Country Sector', as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
      f.input :question
      f.input :score
      f.input :rank
    end
    f.actions
  end

  show title: proc { |q| "#{q.country_sector.country.name} (#{q.country_sector.sector.name}) - #{q.question.name}"}  do
    panel 'Country Sector Question Details' do
      attributes_table_for country_sector_question do
        row 'Indicator' do
          text_node link_to "#{country_sector_question.country_sector_indicator.indicator.name}",
                            country_sector_indicator_path(country_sector_question.country_sector_indicator)
        end
        row 'Country Sector' do
          text_node link_to "#{country_sector_question.country_sector.country.name} (#{country_sector_question.country_sector.sector.name})",
                            country_sector_path(country_sector_question.country_sector)
        end
        row :question
        row :score
        row :rank
      end
    end
  end
end