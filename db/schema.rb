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

ActiveRecord::Schema.define(version: 20150921202142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.integer  "creator_id",                         null: false
    t.string   "status",      default: "incomplete"
    t.string   "description",                        null: false
    t.integer  "location_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "locations", ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id", using: :btree

  create_table "receipts", force: :cascade do |t|
    t.integer  "alert_id",    null: false
    t.integer  "mechanic_id", null: false
    t.integer  "location_id"
    t.integer  "distance",    null: false
    t.integer  "duration",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                                                                       null: false
    t.string   "last_name",                                                                                        null: false
    t.string   "username",                                                                                         null: false
    t.string   "email",                                                                                            null: false
    t.string   "phone",                                                                                            null: false
    t.string   "password_digest",                                                                                  null: false
    t.string   "bio",             default: ""
    t.string   "avatar_url",      default: "http://powerlearningny.com/wp-content/uploads/2014/04/blank_male.png"
    t.integer  "location_id"
    t.datetime "created_at",                                                                                       null: false
    t.datetime "updated_at",                                                                                       null: false
  end

end
