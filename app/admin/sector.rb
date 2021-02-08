# frozen_string_literal: true
ActiveAdmin.register Sector do
  menu parent: 'Global', priority: 2
  actions :all, except: [:destroy, :new, :create]
  permit_params :name

  index do
    column :name
    column :updated_at
    actions
  end
  config.filters = false

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Sector Details' do
      f.input :name
    end
    f.actions
  end
end
