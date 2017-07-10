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

ActiveRecord::Schema.define(version: 20170710151236) do

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
    t.index ["agent_id"], name: "index_transactions_on_agent_id"
    t.index ["upline_id"], name: "index_transactions_on_upline_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "upline_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
  end

end
