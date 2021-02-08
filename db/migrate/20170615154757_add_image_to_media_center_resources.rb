class AddImageToMediaCenterResources < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :media_center_resources, :image
  	add_attachment :media_center_resources, :pdf
  end
end
