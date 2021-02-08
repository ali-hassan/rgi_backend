class AddPostDateToMediaCenterResource < ActiveRecord::Migration[5.0]
  def change
  	add_column :media_center_resources, :post_date, :date
  end
end
