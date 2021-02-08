class AddSubtitleToAbout < ActiveRecord::Migration[5.0]
  def change
  	add_column :abouts, :subtitle, :string
  end
end
