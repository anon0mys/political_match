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

ActiveRecord::Schema.define(version: 2018_05_31_201151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "gender"
    t.string "party"
    t.string "twitter_id"
    t.string "facebook_account"
    t.string "next_election"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "overall"
    t.string "owner_type"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_profiles_on_owner_type_and_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
