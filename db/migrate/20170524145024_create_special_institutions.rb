class CreateSpecialInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :special_institutions do |t|
      t.string :institution_type
      t.text :title
      t.references :country_sector, foreign_key: true

      t.timestamps
    end
  end
end
