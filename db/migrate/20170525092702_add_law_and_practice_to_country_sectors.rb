class AddLawAndPracticeToCountrySectors < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sectors, :law, :int
    add_column :country_sectors, :practice, :int
  end
end
