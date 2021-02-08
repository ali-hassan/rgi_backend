# frozen_string_literal: true
ActiveAdmin.register Indicator do
  menu parent: 'Polls', priority: 2
  belongs_to :subcategory, optional: true

  actions :all, except: [:destroy, :new]
  permit_params :name, :description

  sidebar :questions, only: :show do
    sidebar = Question.where(indicator: resource).collect do |question|
      auto_link(question, question.name.camelize)
    end
    safe_join(sidebar, content_tag('br'))
  end


  index do
    column :subcategory
    column :name
    column :position
    column :description
    actions
  end

  filter :subcategory
  filter :name
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Indicator Details' do
      f.input :subcategory, input_html: { disabled: true }
      f.input :name
      f.input :position
      f.input :description, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
    end
    f.actions
  end
end