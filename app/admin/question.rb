# frozen_string_literal: true
ActiveAdmin.register Question do
  menu parent: 'Polls', priority: 3
  belongs_to :indicator, optional: true

  actions :all, except: [:destroy, :new]
  permit_params :name, :description

  sidebar :answers, only: :show do
    sidebar = Answer.where(question: resource).collect do |answer|
      auto_link(answer, answer.name.camelize)
    end
    safe_join(sidebar, content_tag('br'))
  end


  index do
    column :indicator
    column :name
    column :position
    column :description
    actions
  end

  filter :indicator
  filter :name
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Question Details' do
      f.input :indicator, input_html: { disabled: true }
      f.input :number, input_html: { disabled: true }
      f.input :name
      f.input :position
      f.input :description, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
    end
    f.actions
  end
end
