# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_084919) do

# Could not dump table "adventures" because of following StandardError
#   Unknown type '' for column 'hashtags'

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "adventure_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["adventure_id"], name: "index_comments_on_adventure_id"
  end

  create_table "destinationcomments", force: :cascade do |t|
    t.text "body"
    t.integer "destination_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_id"], name: "index_destinationcomments_on_destination_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parkcomments", force: :cascade do |t|
    t.text "body"
    t.integer "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_parkcomments_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "adventures"
  add_foreign_key "destinationcomments", "destinations"
  add_foreign_key "parkcomments", "parks"
end
