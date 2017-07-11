# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170711161026) do

  create_table "holds", force: :cascade do |t|
    t.string   "acct"
    t.integer  "invoice"
    t.date     "issue_date"
    t.string   "rev"
    t.string   "traveler"
    t.date     "dep_date"
    t.date     "ret_date"
    t.string   "method"
    t.string   "ticket"
    t.string   "itinerary"
    t.string   "name"
    t.string   "c2go"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "fare_total", precision: 8, scale: 4
    t.decimal  "comm_total", precision: 8, scale: 4
    t.decimal  "air",        precision: 8, scale: 4
    t.decimal  "eight_nine", precision: 8, scale: 4
    t.decimal  "upline",     precision: 8, scale: 4
    t.decimal  "paid_agent", precision: 8, scale: 4
    t.integer  "evo_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "agent_id"
    t.integer  "upline_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "invoice"
    t.decimal  "agent_total",      precision: 8, scale: 4
    t.decimal  "upline_total",     precision: 8, scale: 4
    t.decimal  "evo_total",        precision: 8, scale: 4
    t.decimal  "commission_total", precision: 8, scale: 4
    t.string   "country"
    t.index ["agent_id"], name: "index_transactions_on_agent_id"
    t.index ["upline_id"], name: "index_transactions_on_upline_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "upline_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "act"
    t.string   "invoice"
    t.string   "revenue_type"
    t.string   "ticket_id"
    t.string   "traveler"
    t.string   "dep_date"
    t.string   "ret_date"
    t.integer  "evo_id"
    t.string   "first"
    t.string   "last"
    t.decimal  "balance",      precision: 8, scale: 4
    t.string   "c2go"
    t.string   "web_name"
    t.string   "address"
    t.string   "apt"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
  end

end
