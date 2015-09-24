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
