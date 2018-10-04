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

ActiveRecord::Schema.define(version: 2018_10_04_150432) do

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
    t.integer "sms_count", default: 0
    t.integer "alt_instrument_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "venue_id", null: false
    t.string "priv_hash", null: false
    t.boolean "is_template", default: false
    t.string "title", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.string "short_description"
    t.text "description"
    t.string "map_link"
    t.text "musician_info"
    t.jsonb "optional_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priv_hash"], name: "index_gigs_on_priv_hash", unique: true
    t.index ["user_id"], name: "index_gigs_on_user_id"
    t.index ["venue_id"], name: "index_gigs_on_venue_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_instruments_on_name", unique: true
  end

  create_table "musicians", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "linked_user_id"
    t.integer "instrument_id"
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone", null: false
    t.jsonb "optional_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linked_user_id"], name: "index_musicians_on_linked_user_id"
    t.index ["user_id", "email"], name: "index_musicians_on_user_id_and_email", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.integer "gig_musician_membership_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gig_musician_membership_id"], name: "index_payments_on_gig_musician_membership_id"
  end

  create_table "user_venue_votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "venue_id", null: false
    t.boolean "accurate", default: true
    t.jsonb "corrections", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id", "user_id"], name: "index_user_venue_votes_on_venue_id_and_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone"
    t.jsonb "optional_data", default: {}
    t.string "crypted_password"
    t.string "salt"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_confirmed", default: false
    t.string "address1", null: false
    t.string "address2"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "city", null: false
    t.string "state", limit: 2, null: false
    t.string "zipcode", null: false
    t.text "description"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.jsonb "optional_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_venues_on_city"
    t.index ["name"], name: "index_venues_on_name"
    t.index ["state"], name: "index_venues_on_state"
  end

end
