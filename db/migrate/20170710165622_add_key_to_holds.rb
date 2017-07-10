class AddKeyToHolds < ActiveRecord::Migration[5.0]
  def change
	# add_reference :holds, :evo, references: :users, index: true
	# add_foreign_key :holds, :users, column: :evo_id
  end
end
