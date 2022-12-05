# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_04_065758) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "gruppettos", force: :cascade do |t|
    t.bigint "track_id", null: false
    t.bigint "user_id", null: false
    t.datetime "start", precision: nil
    t.string "name"
    t.text "description"
    t.float "avg_speed"
    t.integer "gruppetto_status"
    t.integer "difficulty"
    t.integer "event_type"
    t.integer "participation_rule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_gruppettos_on_track_id"
    t.index ["user_id"], name: "index_gruppettos_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "gruppetto_id", null: false
    t.bigint "user_id", null: false
    t.integer "participation_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gruppetto_id"], name: "index_participations_on_gruppetto_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.float "total_km"
    t.float "total_vm"
    t.text "data_gpx"
    t.text "data_geojson"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "encoded_coordinates"
    t.text "encoded_elevations"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "about"
    t.integer "level"
    t.string "zip_code"
    t.string "country"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "gruppettos", "tracks"
  add_foreign_key "gruppettos", "users"
  add_foreign_key "participations", "gruppettos"
  add_foreign_key "participations", "users"
  add_foreign_key "tracks", "users"
end
