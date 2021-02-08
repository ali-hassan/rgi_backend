class CreateMediaCenterResources < ActiveRecord::Migration[5.0]
  def change
    create_table :media_center_resources do |t|
    	t.string :type
    	t.string :link
    	t.string :title
    	t.text :description
    	
    	t.timestamps
    end
  end
end
