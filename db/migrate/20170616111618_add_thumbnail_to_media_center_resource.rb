class AddThumbnailToMediaCenterResource < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :media_center_resources, :thumbnail
  end
end
