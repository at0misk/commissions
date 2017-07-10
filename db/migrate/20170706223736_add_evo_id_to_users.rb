class AddEvoIdToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :evo_id, :integer, :unique => true
  end
end
