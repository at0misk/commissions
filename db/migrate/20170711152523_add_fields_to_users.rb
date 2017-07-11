class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :c2go, :string
  	add_column :users, :web_name, :string
  	add_column :users, :address, :string
  	add_column :users, :apt, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip, :string
  	add_column :users, :country, :string
  	add_column :users, :phone, :string
  	add_column :users, :email, :string
  end
end
