class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.integer :about_id
      t.attachment :image

      t.timestamps
    end
  end
end
