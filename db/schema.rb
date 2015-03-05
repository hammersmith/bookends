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

ActiveRecord::Schema.define(version: 20150305031801) do

  create_table "books", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_id"
    t.integer  "status",      default: 0
    t.string   "condition"
    t.integer  "order_id"
    t.integer  "donation_id"
  end

  create_table "donations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "book_qty"
    t.decimal  "cash_amt",   precision: 10, scale: 0
    t.date     "thanked_on"
  end

  create_table "identifiers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_id"
    t.string   "code"
    t.string   "code_type"
  end

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "shelf"
    t.string   "color"
  end

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status"
    t.date     "created_on"
    t.date     "ordered_on"
    t.date     "pulled_on"
    t.date     "shipped_on"
    t.decimal  "ship_cost",  precision: 10, scale: 0
    t.date     "paid_on"
    t.decimal  "paid_amt",   precision: 10, scale: 0
  end

  create_table "sources", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "provider_key"
    t.string   "provider_url"
    t.integer  "work_id"
  end

  create_table "user_details", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "lt_name"
    t.string   "work_country"
    t.string   "how_referred"
    t.string   "kid_info"
    t.string   "book_prefs"
    t.boolean  "homeschooled"
    t.string   "delivery_method"
    t.integer  "primary_ship_addr"
    t.integer  "secondary_ship_addr"
    t.string   "courier_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.string   "media_format"
    t.string   "publisher"
    t.date     "published_on"
    t.integer  "location_id"
    t.string   "image_url"
  end

end
