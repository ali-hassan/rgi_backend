ActiveAdmin.register Contact do
	menu parent: 'Menu', priority: 9, label: 'Media Center - Contact'
	permit_params :title, :description, :slug

	filter :title
	filter :description

	index do
		column :title
		column :slug
		column :created_at
		column :updated_at
    actions
  end

	show do
		attributes_table do
			row :title
			row :slug
			row :description
			row :updated_at
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Contact Details' do
    	f.input :title
      f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
    	f.input :description
    end
    f.actions
  end
end
