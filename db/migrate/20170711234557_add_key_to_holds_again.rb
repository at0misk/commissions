class AddKeyToHoldsAgain < ActiveRecord::Migration[5.0]
  def change
  	add_column :holds, :key, :string
  end
end
