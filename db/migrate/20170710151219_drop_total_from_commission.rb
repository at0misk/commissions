class DropTotalFromCommission < ActiveRecord::Migration[5.0]
  def change
  	remove_column :transactions, :commission_total
  end
end
