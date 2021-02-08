# frozen_string_literal: true
ActiveAdmin.register Subcategory do
  menu parent: 'Polls', priority: 1
  belongs_to :category, optional: true

  actions :all, except: [:destroy, :new]
  permit_params :name, :source

  sidebar :indicators, only: :show do
    sidebar = Indicator.where(subcategory: resource).collect do |indicator|
      auto_link(indicator, indicator.name.camelize)
    end
    safe_join(sidebar, content_tag('br'))
  end

  filter :source, as: :select, collection: proc { SubcategoryType.keys }

  index do
    column :category
    column :name
    column :position
    column :source do |record|
      if record.source
        SubcategoryType.key_for(record.source)
      else
        '-'
      end
    end
    actions
  end

  filter :category
  filter :name
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Details' do
      f.input :category, input_html: { disabled: true }
      f.input :name
      f.input :position
      f.input :source, as: :select, collection: SubcategoryType.keys
    end
    f.actions
  end
end
