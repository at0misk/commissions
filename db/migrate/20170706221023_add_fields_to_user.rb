class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :act, :string
  	add_column :users, :invoice, :string
  	add_column :users, :revenue_type, :string
  	add_column :users, :ticket_id, :string
  	add_column :users, :traveler, :string
  	add_column :users, :dep_date, :string
  	add_column :users, :ret_date, :string
  end
end
