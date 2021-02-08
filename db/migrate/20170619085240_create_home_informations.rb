class CreateHomeInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :home_informations do |t|
    	t.string :section
      t.string :title
      t.string :subtitle
      t.text :text
      t.string :link_text
      t.string :link_url

      t.timestamps
    end
  end
end
