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

  create_table "books", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_id",     limit: 4
    t.integer  "status",      limit: 4,   default: 0
    t.string   "condition",   limit: 255
    t.integer  "order_id",    limit: 4
    t.integer  "donation_id", limit: 4
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
    t.integer  "book_qty",   limit: 4
    t.decimal  "cash_amt",             precision: 10
    t.date     "thanked_on"
  end

  create_table "identifiers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_id",    limit: 4
    t.string   "code",       limit: 255
    t.string   "code_type",  limit: 255
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.string   "shelf",      limit: 255
    t.string   "color",      limit: 255
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
    t.string   "status",     limit: 255
    t.date     "created_on"
    t.date     "ordered_on"
    t.date     "pulled_on"
    t.date     "shipped_on"
    t.decimal  "ship_cost",              precision: 10
    t.date     "paid_on"
    t.decimal  "paid_amt",               precision: 10
  end

  create_table "sources", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",     limit: 255
    t.string   "provider_key", limit: 255
    t.string   "provider_url", limit: 255
    t.integer  "work_id",      limit: 4
  end

  create_table "user_details", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "lt_name",             limit: 255
    t.string   "work_country",        limit: 255
    t.string   "how_referred",        limit: 255
    t.string   "kid_info",            limit: 255
    t.string   "book_prefs",          limit: 255
    t.boolean  "homeschooled",        limit: 1
    t.string   "delivery_method",     limit: 255
    t.integer  "primary_ship_addr",   limit: 4
    t.integer  "secondary_ship_addr", limit: 4
    t.string   "courier_email",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",        limit: 255
    t.string   "author",       limit: 255
    t.text     "description",  limit: 65535
    t.string   "media_format", limit: 255
    t.string   "publisher",    limit: 255
    t.date     "published_on"
    t.integer  "location_id",  limit: 4
    t.string   "image_url",    limit: 255
  end

end
