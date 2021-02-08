class AddAboutIdToDocument < ActiveRecord::Migration[5.0]
  def change
  	add_column :documents, :about_id, :integer
  end
end
