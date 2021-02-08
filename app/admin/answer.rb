# frozen_string_literal: true
ActiveAdmin.register Answer do
  menu parent: 'Polls', priority: 4
  belongs_to :question, optional: true

  actions :all, except: [:destroy, :new]
  permit_params :name, :answer_type, :value_number, :value_string, :question

  index do
    column :question
    column :name
    column :answer_type
    column :value_number
    column :value_string
    actions
  end

  filter :question
  filter :name
  filter :updated_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Country Details' do
      f.input :question, input_html: { disabled: true }
      f.input :name
      f.input :answer_type
      f.input :value_number
      f.input :value_string
    end
    f.actions
  end

end
