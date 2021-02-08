# frozen_string_literal: true
ActiveAdmin.register CountrySectorIndicator do
  menu parent: 'Results', priority: 2, label: 'Indicators'
  belongs_to :country_sector, optional: true

  permit_params :country_sector_id, :indicator_id, :score, :rank

  sidebar 'Questions', only: :show do
    attributes_table_for resource do
      ul do
        resource.country_sector_questions.collect do |csq|
          li link_to(csq.question.name, country_sector_question_path(csq.id))
        end
      end
    end
  end

  index do
    column :country_sector do |cs|
      "#{cs.country_sector.country.name}, #{cs.country_sector.sector.name}"
    end
    column :indicator
    column :score
    column :rank
    column :updated_at
    actions
  end

  filter :country_sector, as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
  filter :indicator
  filter :score
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Sector Indicator Details' do
      f.input :country_sector_id, label: 'Country Sector', as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
      f.input :indicator
      f.input :score
      f.input :rank
    end
    f.actions
  end

  show title: proc { |i| "#{i.country_sector.country.name} (#{i.country_sector.sector.name}) - #{i.indicator.name}"}  do
    panel 'Country Sector Indictor Details' do
      attributes_table_for country_sector_indicator do
        row 'Sub Component' do
          text_node link_to "#{country_sector_indicator.country_sector_subcategory.subcategory.name}",
                            country_sector_subcategory_path(country_sector_indicator.country_sector_subcategory)
        end
        row 'Country Sector' do
          text_node link_to "#{country_sector_indicator.country_sector.country.name} (#{country_sector_indicator.country_sector.sector.name})",
                            country_sector_path(country_sector_indicator.country_sector)
        end
        row :indicator
        row :score
        row :rank
      end
    end
  end
end