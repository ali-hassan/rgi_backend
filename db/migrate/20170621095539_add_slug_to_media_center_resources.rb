class AddSlugToMediaCenterResources < ActiveRecord::Migration[5.0]
  def change
  	add_column :media_center_resources, :slug, :string
  end
end
