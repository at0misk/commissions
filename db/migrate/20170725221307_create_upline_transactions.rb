class CreateUplineTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :upline_transactions do |t|
      t.references :agent, foreign_key: true
      t.references :upline, foreign_key: true

      t.timestamps
    end
    add_column :upline_transactions, :agent_name, :string
  	add_column :upline_transactions, :c2go, :string
  	add_column :upline_transactions, :processed, :boolean
  	add_column :upline_transactions, :key, :string
  	add_column :upline_transactions, :issue_date, :date
  	add_column :upline_transactions, :traveler, :string
  	add_column :upline_transactions, :itinerary, :string
  	add_column :upline_transactions, :country, :string
  	add_column :upline_transactions, :agent_total, :decimal, :precision => 8, :scale => 4
  	add_column :upline_transactions, :upline_total, :decimal, :precision => 8, :scale => 4
  	add_column :upline_transactions, :evo_total, :decimal, :precision => 8, :scale => 4
  	add_column :upline_transactions, :invoice, :integer
  end
end
