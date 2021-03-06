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

ActiveRecord::Schema.define(version: 2021_06_19_220221) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "booking_schedules", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booking_schedules_on_booking_id"
    t.index ["schedule_id"], name: "index_booking_schedules_on_schedule_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "client_id", null: false
    t.boolean "confirm_client", default: false
    t.boolean "confirm_service", default: false
    t.integer "status", default: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.bigint "service_id", null: false
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_services", id: false, force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_categories_services_on_category_id"
    t.index ["service_id"], name: "index_categories_services_on_service_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id", null: false
    t.integer "service_client_id", null: false
    t.index ["booking_id"], name: "index_chats_on_booking_id"
    t.index ["client_id", "service_client_id"], name: "index_chats_on_client_id_and_service_client_id"
  end

  create_table "comments", force: :cascade do |t|
    t.float "rating", default: 0.0
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_comments_on_booking_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.text "body"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["sender_id", "receiver_id"], name: "index_messages_on_sender_id_and_receiver_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean "state", default: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "notificable_type"
    t.bigint "notificable_id"
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "price"
    t.boolean "is_closed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_id", null: false
    t.datetime "start_date"
    t.index ["service_id"], name: "index_schedules_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "description"
    t.string "region"
    t.string "comuna"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "last_job"
    t.datetime "start_date_last_job"
    t.datetime "end_date_last_job"
    t.text "description_last_job"
    t.string "categories_last_job", default: [], array: true
    t.string "address_last_job"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "birthday"
    t.integer "role", default: 0
    t.string "phone", null: false
    t.boolean "terms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "working_settings", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "array_hours", null: false, array: true
    t.string "array_days", null: false, array: true
    t.integer "hour_price", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_working_settings_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "booking_schedules", "bookings"
  add_foreign_key "booking_schedules", "schedules"
  add_foreign_key "bookings", "services"
  add_foreign_key "chats", "bookings"
  add_foreign_key "comments", "bookings"
  add_foreign_key "comments", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "schedules", "services"
  add_foreign_key "services", "users"
end
