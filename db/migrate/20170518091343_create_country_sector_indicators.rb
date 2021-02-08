class CreateCountrySectorIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :country_sector_indicators do |t|
      t.decimal :score
      t.integer :rank
      t.references :country_sector, foreign_key: true
      t.references :indicator, foreign_key: true
    end
  end
end
