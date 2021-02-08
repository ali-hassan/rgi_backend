ActiveAdmin.register PhotoGallery do
  menu parent: 'Menu', priority: 8, label: 'Media Center - Photo Gallery'
	permit_params :image, :position, :thumbnail, :post_date, :slug, :title

	filter :position

	index do
		column :title
		column :slug
		column :position
		column :post_date
		column :thumbnail do |photo_gallery|
			image_tag(photo_gallery.thumbnail.url(:thumb)) unless photo_gallery.thumbnail.blank?
		end
		column :image do |photo_gallery|
			image_tag(photo_gallery.image.url(:thumb)) unless photo_gallery.image.blank?
		end
		column :created_at
		column :updated_at
		actions
	end

	show do
		attributes_table do
			row :title
			row :slug
			row :position
			row :post_date
			row :updated_at
			row :thumbnail do |photo_gallery|
				image_tag(photo_gallery.thumbnail.url(:thumb)) unless photo_gallery.thumbnail.blank?
			end
			row :image do |photo_gallery|
				image_tag(photo_gallery.image.url(:thumb)) unless photo_gallery.image.blank?
			end
		end
	end

	form do |f|
		f.semantic_errors *f.object.errors.keys
		f.inputs 'Photo Details' do
			f.input :title
			f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
			f.input :position
			f.input :post_date, as: :datepicker
			f.input :thumbnail, as: :file, hint: f.object.thumbnail.present? ? \
        image_tag(f.object.thumbnail.url(:thumb)) : content_tag(:span, 'No thumbnail yet')
			f.input :image, as: :file, hint: f.object.image.present? ? \
			image_tag(f.object.image.url(:thumb)) : content_tag(:span, 'No image yet')
		end
		f.actions
	end
end
