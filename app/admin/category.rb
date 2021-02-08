# frozen_string_literal: true
ActiveAdmin.register Category do
  menu parent: 'Polls', priority: 0, label: 'Component'

  actions :all, except: [:destroy, :new]
  permit_params :name

  sidebar :subcomponents, only: :show do
    sidebar = Subcategory.where(category: resource).collect do |sub|
      auto_link(sub, sub.name.camelize)
    end
    safe_join(sidebar, content_tag('br'))
  end

  index do
    column :name
    column :position
    actions
  end

  filter :name
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Details' do
      f.input :name
      f.input :position
    end
    f.actions
  end

end
