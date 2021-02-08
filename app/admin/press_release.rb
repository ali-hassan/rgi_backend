ActiveAdmin.register PressRelease do
	menu parent: 'Menu', priority: 2, label: 'Media Center - Press Releases'
	permit_params :title, :pdf, :post_date, :slug

	filter :title

	index do
    column :title
    column :slug
    column :post_date
    column :pdf_name do |press|
    	press.pdf_file_name.present? ? "#{press.pdf_file_name}" : content_tag(:span, 'No PDF yet')
    end
    column :created_at
    column :updated_at
    actions
  end

	show do
		attributes_table do
			row :title
			row :slug
			row :post_date
			row :pdf do |file|
				link_to file.pdf_file_name, request.base_url + file.pdf.url
			end
			row :created_at
			row :updated_at
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Press Release Details' do
      f.input :title
      f.input :slug, placeholder: 'Slug will be created based on the title, you can change it after.'
      f.input :post_date, as: :datepicker
      f.input :pdf, as: :file, hint: f.object.pdf.present? ? \
        	"#{f.object.pdf_file_name}" : content_tag(:span, 'No PDF yet')
    end
    f.actions
  end
end
