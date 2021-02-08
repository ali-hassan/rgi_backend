ActiveAdmin.register Videoclip do
	menu parent: 'Menu', priority: 4, label: 'Media Center - Videoclips'
	permit_params :title, :link, :description, :thumbnail, :post_date, :slug

	filter :title
	filter :link
	filter :description

	index do
    column :title
    column :slug
    column :link do |videoclip|
    	link_to videoclip.link, "http://#{videoclip.link}"
    end
    column :thumbnail do |videoclip|
			image_tag(videoclip.thumbnail.url(:thumb)) unless videoclip.thumbnail.blank?
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
			row :thumbnail do |videoclip|
				image_tag(videoclip.thumbnail.url(:thumb)) unless videoclip.thumbnail.blank?
			end
			row :link do |videoclip|
    		link_to videoclip.link, "http://#{videoclip.link}"
    	end
			row :description
			row :post_date
			row :created_at
			row :updated_at
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Videoclip Details' do
      f.input :title
      f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
      f.input :link
      f.input :post_date, as: :datepicker
      f.input :description
      f.input :thumbnail, as: :file, hint: f.object.thumbnail.present? ? \
        image_tag(f.object.thumbnail.url(:thumb)) : content_tag(:span, 'No thumbnail yet')
    end
    f.actions
  end
end
