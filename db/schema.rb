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

ActiveRecord::Schema.define(version: 2021_10_25_182251) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "gig_musician_memberships", force: :cascade do |t|
    t.integer "gig_id", null: false
    t.integer "musician_id", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.integer "confirmation_status", default: 0
    t.integer "email_count", default: 0
    t.integer "payment_amount_cents", default: 0, null: false
    t.string "payment_amount_currency", default: "USD", null: false
    t.datetime "payment_confirmed_at"
    t.text "musician_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.integer "region_id", null: false
    t.integer "user_id", null: false
    t.integer "venue_id", null: false
    t.string "priv_hash", null: false
    t.string "title", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.string "short_description"
    t.text "description"
    t.string "map_link"
    t.text "musician_text"
    t.datetime "reminder_at"
    t.jsonb "optional_data", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["priv_hash"], name: "index_gigs_on_priv_hash", unique: true
    t.index ["user_id"], name: "index_gigs_on_user_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "email", null: false
    t.string "full_name", null: false
    t.string "instrument"
    t.string "phone"
    t.jsonb "optional_data", default: {}
    t.integer "num_gigs", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "email"], name: "index_musicians_on_user_id_and_email", unique: true
  end

  create_table "regions", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "region_id", null: false
    t.string "url_name", null: false
    t.string "email", null: false
    t.string "instrument"
    t.string "first_name"
    t.string "last_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone"
    t.jsonb "optional_data", default: {}
    t.datetime "gigs_last_updated_at"
    t.string "crypted_password"
    t.string "salt"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["url_name"], name: "index_users_on_url_name", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", limit: 2, null: false
    t.string "zipcode", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "timezone"
    t.text "description"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.integer "num_gigs", default: 0
    t.jsonb "optional_data", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["latitude", "longitude"], name: "index_venues_on_latitude_and_longitude"
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

end
