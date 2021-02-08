class RemoveScoreFromCountries < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :score
  end
end
