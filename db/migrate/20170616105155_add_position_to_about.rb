class AddPositionToAbout < ActiveRecord::Migration[5.0]
  def change
  	add_column :abouts, :position, :integer
  end
end
