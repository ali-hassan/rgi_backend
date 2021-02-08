class AddSlugToAbouts < ActiveRecord::Migration[5.0]
  def change
  	add_column :abouts, :slug, :string
  end
end
