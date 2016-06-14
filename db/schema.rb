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

ActiveRecord::Schema.define(version: 20160614102309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "name"
    t.string   "backstory"
    t.string   "attire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_characters_on_game_id", using: :btree
  end

  create_table "evenings", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "game_id"
    t.string   "location"
    t.string   "caveat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_evenings_on_game_id", using: :btree
    t.index ["host_id"], name: "index_evenings_on_host_id", using: :btree
  end

  create_table "event_characters", id: false, force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_event_characters_on_character_id", using: :btree
    t.index ["event_id"], name: "index_event_characters_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "title"
    t.integer  "chronology"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_events_on_game_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "backstory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guest_characters", id: false, force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "character_id"
    t.integer  "evening_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_guest_characters_on_character_id", using: :btree
    t.index ["evening_id"], name: "index_guest_characters_on_evening_id", using: :btree
    t.index ["guest_id"], name: "index_guest_characters_on_guest_id", using: :btree
  end

  create_table "guests", force: :cascade do |t|
    t.integer  "evening_id"
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["evening_id"], name: "index_guests_on_evening_id", using: :btree
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_hosts_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_hosts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_hosts_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "characters", "games"
  add_foreign_key "evenings", "games"
  add_foreign_key "evenings", "hosts"
  add_foreign_key "event_characters", "characters"
  add_foreign_key "event_characters", "events"
  add_foreign_key "events", "games"
  add_foreign_key "guest_characters", "characters"
  add_foreign_key "guest_characters", "evenings"
  add_foreign_key "guest_characters", "guests"
  add_foreign_key "guests", "evenings"
end
