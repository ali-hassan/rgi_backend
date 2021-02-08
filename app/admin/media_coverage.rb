ActiveAdmin.register MediaCoverage do
  menu parent: 'Menu', priority: 5, label: 'Media Center - Media Coverage'
	permit_params :title, :link, :post_date, :slug

	filter :title
	filter :link

	index do
    column :title
    column :slug
    column :link do |media_coverage|
    	link_to media_coverage.link, "http://#{media_coverage.link}"
    end
    column :post_date
    column :created_at
    column :updated_at
    actions
  end

	show do
		attributes_table do
			row :title
			row :slug
			row :link do |media_coverage|
    		link_to media_coverage.link, "http://#{media_coverage.link}"
    	end
    	row :post_date
    	row :created_at
			row :updated_at
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Media Coverage Details' do
      f.input :title
      f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
      f.input :link
      f.input :post_date, as: :datepicker
    end
    f.actions
  end
end
