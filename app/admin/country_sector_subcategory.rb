# frozen_string_literal: true
ActiveAdmin.register CountrySectorSubcategory do
  menu parent: 'Results', priority: 1, label: 'Sub Components'
  belongs_to :country_sector, optional: true

  permit_params :country_sector_id, :subcategory_id, :score, :rank

  sidebar 'Indicators', only: :show do
    attributes_table_for resource do
      ul do
        resource.country_sector_indicators.collect do |csi|
          li link_to(csi.indicator.name, country_sector_indicator_path(csi.id))
        end
      end
    end
  end

  index do
    column :country_sector do |cs|
      "#{cs.country_sector.country.name}, #{cs.country_sector.sector.name}"
    end
    column :subcategory
    column :score
    column :rank
    column :updated_at
    actions
  end

  filter :country_sector, as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
  filter :subcategory
  filter :score
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Sector Sub Component Details' do
      f.input :country_sector_id, label: 'Country Sector', as: :select, collection: CountrySector.all.map {|cs| ["#{cs.country.name}, #{cs.sector.name}", cs.id]}
      f.input :subcategory
      f.input :score
      f.input :rank
    end
    f.actions
  end

  show title: proc { |s| "#{s.country_sector.country.name} (#{s.country_sector.sector.name}) - #{s.subcategory.name}"}  do
    panel 'Country Sector Sub Component Details' do
      attributes_table_for country_sector_subcategory do
        row 'Component' do
          text_node link_to "#{country_sector_subcategory.country_sector_category.category.name}",
                            country_sector_category_path(country_sector_subcategory.country_sector_category)
        end
        row 'Country Sector' do
          text_node link_to "#{country_sector_subcategory.country_sector.country.name} (#{country_sector_subcategory.country_sector.sector.name})",
                            country_sector_path(country_sector_subcategory.country_sector)
        end
        row :subcategory
        row :score
        row :rank
      end
    end
  end

end