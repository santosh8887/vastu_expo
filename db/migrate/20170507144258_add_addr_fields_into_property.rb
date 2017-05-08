class AddAddrFieldsIntoProperty < ActiveRecord::Migration
  def change
  	remove_column :properties, :address
  	add_column :properties, :address_line_1, :string
  	add_column :properties, :address_line_2, :string
  	add_column :properties, :area, :string
  	add_column :properties, :city, :string
  	add_column :properties, :pin, :string
  	add_column :properties, :state, :string
  	add_column :properties, :country, :string
  end
end
