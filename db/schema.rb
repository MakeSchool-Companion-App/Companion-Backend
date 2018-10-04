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

ActiveRecord::Schema.define(version: 20181004041340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.string "event", null: false
    t.time "event_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "beacon_id"
    t.index ["beacon_id"], name: "index_attendances_on_beacon_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "beacons", force: :cascade do |t|
    t.string "hardware_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hardware_id"], name: "index_beacons_on_hardware_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "first_name"
    t.string "last_name"
    t.string "user_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "attendances", "beacons"
  add_foreign_key "attendances", "users"
end
