class AddCalculatedValuesToIndicator < ActiveRecord::Migration[5.0]
  def change
    add_column :indicators, :average, :decimal
    add_column :indicators, :min, :decimal
    add_column :indicators, :max, :decimal
  end
end
