# frozen_string_literal: true
ActiveAdmin.register CountrySectorCategory do
  menu parent: 'Results', priority: 0, label: 'Components'
  belongs_to :country_sector, optional: true

  permit_params :country_sector_id, :category_id, :score, :rank

  sidebar 'Sub Components', only: :show do
    attributes_table_for resource do
      ul do
        resource.country_sector_subcategories.collect do |cssc|
          li link_to(cssc.subcategory.name, country_sector_subcategory_path(cssc.id))
        end
      end
    end
  end

  index do
    column :country_sector do |cs|
      "#{cs.country_sector.country.name}, #{cs.country_sector.sector.name}"
    end
    column :category
    column :score
    column :rank
    column :updated_at
    actions
  end

  filter :country_sector, as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
  filter :category
  filter :score
  filter :updated_at

  form do |f|
    f.semantic_errors
    f.inputs 'Country Sector Component Details' do
      f.input :country_sector_id, label: 'Country Sector', as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
      f.input :category
      f.input :score
      f.input :rank
    end
    f.actions
  end

  show title: proc { |c| "#{c.country_sector.country.name} (#{c.country_sector.sector.name}) - #{c.category.name}"}  do
    panel 'Country Sector Component Details' do
      attributes_table_for country_sector_category do
        row 'Country Sector' do
          text_node link_to "#{country_sector_category.country_sector.country.name} (#{country_sector_category.country_sector.sector.name})",
                            country_sector_path(country_sector_category.country_sector)
        end
        row :category
        row :score
        row :rank
      end
    end
  end
end
