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

ActiveRecord::Schema.define(version: 20150712110742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "name",       limit: 100, null: false
    t.string   "phone",      limit: 10,  null: false
    t.string   "email",      limit: 100, null: false
    t.datetime "start_time",             null: false
    t.string   "tab_name",   limit: 10,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "bookings", ["venue_id"], name: "index_bookings_on_venue_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "name",       limit: 100, null: false
    t.string   "phone",      limit: 10,  null: false
    t.string   "email",      limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "customers", ["venue_id"], name: "index_customers_on_venue_id", using: :btree

  create_table "hours", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "day",                 limit: 100, null: false
    t.datetime "open_time",                       null: false
    t.datetime "close_time",                      null: false
    t.string   "interval",            limit: 100, null: false
    t.integer  "covers_per_interval",             null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "hours", ["venue_id"], name: "index_hours_on_venue_id", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "name",           limit: 128, null: false
    t.string   "phone",          limit: 12,  null: false
    t.string   "address",        limit: 128, null: false
    t.string   "email",          limit: 128, null: false
    t.string   "number_of_tabs", limit: 128, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "venues", force: :cascade do |t|
    t.integer  "organisation_id"
    t.string   "name",            limit: 100, null: false
    t.string   "phone",           limit: 10,  null: false
    t.string   "email",           limit: 100, null: false
    t.string   "address",         limit: 128, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "venues", ["organisation_id"], name: "index_venues_on_organisation_id", using: :btree

end
