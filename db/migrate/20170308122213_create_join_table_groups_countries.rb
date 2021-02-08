# frozen_string_literal: true
class CreateJoinTableGroupsCountries < ActiveRecord::Migration[5.0]
  def change
    create_join_table :groups, :countries do |t|
      # t.index [:group_id, :country_id]
      # t.index [:country_id, :group_id]
    end
  end
end
