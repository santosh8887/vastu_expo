class AddAddrFieldsIntoProperty < ActiveRecord::Migration
  def change
  	add_column :properties, :address_line_1, :string
  	add_column :properties, :address_line_2, :string
  	add_column :properties, :area, :string
  	add_column :properties, :city, :string
  	add_column :properties, :pin, :string
  	add_column :properties, :state, :string
  	add_column :properties, :country, :string
    add_column :properties, :is_futured, :boolean, default: false
  end

  def up
    remove_column :properties, :address
  end

  def down
    add_column :properties, :address, :text
  end

  
end
