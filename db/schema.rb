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

ActiveRecord::Schema.define(version: 2019_01_18_143131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "img_url"
    t.string "review"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_experiences_on_trip_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.string "away_team_id"
    t.string "home_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "id_team"
    t.string "stadium_img"
    t.string "stadium_name"
    t.string "stadium_location"
    t.string "website"
    t.string "logo"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.string "title"
    t.string "hotel"
    t.string "transportation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_trips_on_game_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "home_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "experiences", "trips"
  add_foreign_key "trips", "games"
  add_foreign_key "trips", "users"
end
