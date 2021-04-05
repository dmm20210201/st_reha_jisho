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

ActiveRecord::Schema.define(version: 2021_04_05_131222) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rehabilitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rehabilitaion_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "rehabilitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rehabilitations", force: :cascade do |t|
    t.string "training_name"
    t.string "speech_pathological_findings"
    t.text "adaptation_precautions"
    t.text "items"
    t.text "training_content"
    t.string "training_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.string "email"
    t.string "encrypted_password"
    t.string "affiliation"
    t.text "introduction"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
