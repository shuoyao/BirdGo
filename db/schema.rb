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

ActiveRecord::Schema.define(version: 20161102063052) do

  create_table "birds", force: :cascade do |t|
    t.string   "name"
    t.string   "wiki_link"
    t.date     "last_seen"
    t.integer  "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birds_wishlists", id: false, force: :cascade do |t|
    t.integer "wishlist_id"
    t.integer "bird_id"
  end

  add_index "birds_wishlists", ["bird_id"], name: "index_birds_wishlists_on_bird_id"
  add_index "birds_wishlists", ["wishlist_id"], name: "index_birds_wishlists_on_wishlist_id"

  create_table "pins", force: :cascade do |t|
    t.string   "name"
    t.integer  "bird_id"
    t.float    "locationX"
    t.float    "locationY"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wishlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "bird_ids"
    t.text     "seens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id"

end
