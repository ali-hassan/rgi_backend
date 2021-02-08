class AddOrderToMediaCenterResource < ActiveRecord::Migration[5.0]
  def change
  	add_column :media_center_resources, :order, :integer
  end
end
