# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140620170941) do

  create_table "account_entries", force: true do |t|
    t.float    "time"
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.string   "type"
    t.decimal  "amount",      precision: 10, scale: 0
    t.string   "state"
  end

  create_table "accounts", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "email"
    t.string   "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance",    precision: 10, scale: 0
    t.integer  "zipcode"
    t.string   "state"
    t.string   "city"
    t.integer  "employees"
  end

  create_table "employees_projects", force: true do |t|
    t.integer  "employee_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
