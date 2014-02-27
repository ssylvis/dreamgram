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

ActiveRecord::Schema.define(version: 20140227061001) do

  create_table "accounts", force: true do |t|
    t.string   "email",                null: false
    t.string   "first_name",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "uid",                  null: false
    t.string   "last_name"
    t.string   "remember_token"
  end

  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["uid"], name: "index_accounts_on_uid", unique: true

  create_table "dreams", force: true do |t|
    t.string   "description",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "account_id",   null: false
    t.datetime "completed_at"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.integer  "crop_w"
    t.integer  "crop_h"
  end

  add_index "dreams", ["account_id"], name: "index_dreams_on_account_id"

  create_table "oauths", force: true do |t|
    t.integer "account_id"
    t.string  "provider"
    t.string  "provider_uid"
  end

  add_index "oauths", ["provider", "provider_uid"], name: "index_oauths_on_provider_and_provider_uid", unique: true

end
