class AddEvoIdToHolds < ActiveRecord::Migration[5.0]
  def change
  	add_column :holds, :evo_id, :integer
  end
end
