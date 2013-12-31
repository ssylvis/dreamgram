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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131230055848) do

  create_table "dreams", :force => true do |t|
    t.string   "description",                 :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "image"
    t.integer  "user_id",      :default => 0, :null => false
    t.datetime "completed_at"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.integer  "crop_w"
    t.integer  "crop_h"
  end

  add_index "dreams", ["user_id"], :name => "index_dreams_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",              :null => false
    t.string   "name",               :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
