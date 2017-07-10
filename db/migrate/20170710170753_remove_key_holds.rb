class RemoveKeyHolds < ActiveRecord::Migration[5.0]
  def change
	remove_reference :holds, :evo
	remove_foreign_key :holds, :users
  end
end
