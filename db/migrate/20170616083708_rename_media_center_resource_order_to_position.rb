class RenameMediaCenterResourceOrderToPosition < ActiveRecord::Migration[5.0]
  def change
  	rename_column :media_center_resources, :order, :position
  end
end
