class AddNamesToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :first, :string
  	add_column :users, :last, :string
  end
end
