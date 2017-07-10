class CreateHolds < ActiveRecord::Migration[5.0]
  def change
    create_table :holds do |t|
      t.string :acct
      t.integer :invoice
      t.date :issue_date
      t.string :rev
      t.string :traveler
      t.date :dep_date
      t.date :ret_date
      t.string :method
      t.string :ticket
      t.string :itinerary
      t.string :name
      t.string :c2go
      t.string :email

      t.timestamps
    end
  end
end
