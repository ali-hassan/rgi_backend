ActiveAdmin.register About do
	menu parent: 'Menu', priority: 1, label: 'About'

	permit_params :title, :text, :position, :subtitle, :slug,
								documents_attributes: [:document, :title, :id, :_destroy],
								images_attributes: [:image, :title, :id, :_destroy]

	index do
    column :title
    column :subtitle
    column :slug
    column :position
    column :created_at
    column :updated_at
    actions
  end

  show do |about|
    attributes_table do
      row :title
      row :subtitle
      row :slug
      row :text
      row :position
      row :documents do
      	if about.documents.present?
					links = about.documents.map do |document|
						link_to document.document_file_name, request.base_url + document.document.url
					end.join(', ')

					raw links
				end
      end

      row :image do
      	if about.images.present?    		
	      	images = about.images.map do |image|
	      		image_tag(image.image.url(:thumb))
	      	end.join('')

      		raw images
      	end
      end

      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'About details' do
      f.input :title
      f.input :subtitle
			f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
      f.input :position
      f.input :text, as: :ckeditor, input_html: { ckeditor: { toolbar: 'image' } }

      f.has_many :images, allow_destroy: true, new_record: true, heading: 'Images' do |a|
      	a.input :title
      	a.input :image, as: :file, hint: a.object.image.present? ? \
        	image_tag(a.object.image.url(:thumb)) : content_tag(:span, 'No image yet')
      end

      f.has_many :documents, allow_destroy: true, new_record: true, heading: 'Documents' do |a|
      	a.input :title
      	a.input :document, as: :file, allow_destroy: true, hint: a.object.document.present? ? \
        	"#{a.object.document_file_name}" : content_tag(:span, 'No document yet')
      end
      li "Created at #{f.object.created_at}" unless f.object.new_record?
      li "Updated at #{f.object.updated_at}" unless f.object.new_record?
    end
    f.actions
  end
end
