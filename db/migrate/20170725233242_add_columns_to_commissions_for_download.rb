class AddColumnsToCommissionsForDownload < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :sponsor_c2go, :string
  	add_column :transactions, :sponsor_name, :string
  end
end
