class DropEvoFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :evo_id
  end
end
