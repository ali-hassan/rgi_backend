class AddDescriptionToSpecialInstitutions < ActiveRecord::Migration[5.0]
  def change
    add_column :special_institutions, :description, :text
    change_column :special_institutions, :title, :string
  end
end
