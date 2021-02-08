# frozen_string_literal: true
ActiveAdmin.register Country do
  menu parent: 'Global', priority: 1

  permit_params :name, :iso, :score, :description
  config.sort_order = 'name_asc'

  includes :country_sectors

  sidebar :sectors, only: :show do
    sidebar = CountrySector.where(country: resource).collect do |cs|
      auto_link(cs, cs.sector.name.camelize)
    end
    safe_join(sidebar, content_tag('br'))
  end

  sidebar 'Components', only: :show do
    attributes_table_for resource do
      cs_mining = CountrySector.find_by(country_id: resource, sector: Sector.find_by(name: 'mining'))
      cs_oil = CountrySector.find_by(country_id: resource, sector: Sector.find_by(name: 'oil-gas'))
      if cs_mining
        h5 'Mining'
        ul do
          cs_mining.country_sector_categories.collect do |csc|
            li link_to(csc.category.name, country_sector_category_path(csc.id))
          end
        end
      end
      if cs_oil
        h5 'Oil-gas'
        ul do
          cs_oil.country_sector_categories.collect do |csc|
            li link_to(csc.category.name, country_sector_category_path(csc.id))
          end
        end
      end
    end
  end

  index do
    column :name
    column :description
    column :iso
    column :updated_at
    actions
  end

  filter :name
  filter :iso
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Details' do
      f.input :name
      f.input :iso
      f.input :description, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
    end
    f.actions
  end

end
