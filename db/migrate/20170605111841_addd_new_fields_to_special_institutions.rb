class AdddNewFieldsToSpecialInstitutions < ActiveRecord::Migration[5.0]
    def change
      add_column :special_institutions, :name, :string
      add_column :special_institutions, :percentage, :int
      add_column :special_institutions, :revenue_value, :int
      add_column :special_institutions, :revenue_unit, :string
      add_column :special_institutions, :score, :int
      add_column :special_institutions, :rank_1, :int
      add_column :special_institutions, :rank_2, :int
  end
end
