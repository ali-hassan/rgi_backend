class AddNumberToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :number, :int
  end
end
