class CreateGraphs < ActiveRecord::Migration[5.0]
  def change
    remove_column :country_sectors, :law, :int
    remove_column :country_sectors, :practice, :int

    create_table :pl_graphs do |t|
      t.integer :practice
      t.integer :law
      t.integer :gap

      t.timestamps
    end

    create_table :bubble_graphs do |t|
      t.integer :x
      t.decimal :y
      t.decimal :size
      t.string :color

      t.timestamps
    end

    create_table :direction_graphs do |t|
      t.timestamps
    end

    create_table :direction_scores do |t|
      t.references :direction_graph

      t.string :issue
      t.integer :score
      t.string :direction

      t.timestamps
    end

    add_reference :country_sectors, :pl_graph
    add_reference :country_sectors, :bubble_graph
    add_reference :country_sectors, :direction_graph

  end
end
