# frozen_string_literal: true
ActiveAdmin.register Group do
  menu parent: 'Global', priority: 0
  permit_params :name, :description

  includes :countries

  index do
    column :name
    column :description
    actions
  end

  config.filters = false
  config.sort_order = 'name_asc'

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Group Details' do
      f.input :name
      f.input :description
    end
    f.actions
  end

# TODO Check which one is best

#  sidebar :countries, only: :show do
#    sidebar = Group.find(resource).countries.collect do |c|
#      auto_link(c, c.name.camelize)
#    end
#    safe_join(sidebar, content_tag('br'))
#  end

  sidebar 'Countries', only: :show do
    attributes_table_for resource do
      group = Group.find(resource)
        ul do
          group.countries.collect do |country|
            li link_to country.name, country
          end
        end
    end
  end

end
