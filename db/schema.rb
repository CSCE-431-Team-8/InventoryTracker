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

ActiveRecord::Schema.define(version: 20220414010853) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.decimal  "quantity_remaining"
    t.decimal  "quantity_total"
    t.boolean  "rentable"
    t.float    "price"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin"
  end

  add_index "memberships", ["organization_id"], name: "index_memberships_on_organization_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rented_items", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "user_renting"
    t.decimal  "age"
    t.date     "date_rented"
    t.date     "return_date"
    t.decimal  "time_rented"
    t.decimal  "max_rent_time"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "password_digest"
  end

end
