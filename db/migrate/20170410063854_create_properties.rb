class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.text :larg_description
      t.integer :amount
      t.text :address
      t.string :size
      t.string :bedroom
      t.string :bathroom
      t.string :garage
      t.boolean :status
      t.string :uses

      t.timestamps null: false
    end
  end
end
