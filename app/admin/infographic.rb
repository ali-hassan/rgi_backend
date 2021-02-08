ActiveAdmin.register Infographic do
	menu parent: 'Menu', priority: 3, label: 'Media Center - Infographics'
	permit_params :title, :image, :thumbnail, :pdf, :delete_pdf, :delete_image, :slug

	filter :title

	index do
    column :title
    column :slug
    column :thumbnail do |info|
			image_tag(info.thumbnail.url(:thumb)) unless info.thumbnail.blank?
		end
		column :pdf_name do |info|
			info.pdf_file_name.present? ? "#{info.pdf_file_name}" : content_tag(:span, 'No PDF yet')
		end
    column :created_at
    column :updated_at
    actions
  end

	show do
		attributes_table do
			row :title
			row :slug
			row :thumbnail do |info|
				image_tag(info.thumbnail.url(:thumb)) unless info.thumbnail.blank?
			end
			row :pdf do |file|
				link_to file.pdf_file_name, request.base_url + file.pdf.url if file.pdf_file_name.present?
			end
			row :image do |info|
        image_tag(info.image.url(:thumb)) unless info.image.blank?
      end
      row :created_at
      row :updated_at
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Infographic Details' do
      f.input :title
      f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
      f.input :thumbnail, as: :file, hint: f.object.thumbnail.present? ? \
        image_tag(f.object.thumbnail.url(:thumb)) : content_tag(:span, 'No thumbnail yet')

      f.input :pdf, as: :file, hint: f.object.pdf.present? ? \
        	"#{f.object.pdf_file_name}" : content_tag(:span, 'No PDF yet')
      f.input :delete_pdf, as: :boolean if f.object.pdf.present?

      f.input :image, as: :file, hint: f.object.image.present? ? \
        image_tag(f.object.image.url(:thumb)) : content_tag(:span, 'No image yet')
      f.input :delete_image, as: :boolean if f.object.image.present?
    	end
    f.actions
  end
end
