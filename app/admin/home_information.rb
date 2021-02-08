ActiveAdmin.register HomeInformation do
	menu parent: 'Menu', priority: 0

	permit_params :section, :title, :subtitle, :text, :link_text, :link_url

	form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Section details' do
      f.input :section, as: :select, collection: HomeInformation.sections.keys.to_a, include_blank: false
      f.input :title
      f.input :subtitle
      f.input :text
      f.input :link_text
      f.input :link_url
    end
    f.actions
  end

end
