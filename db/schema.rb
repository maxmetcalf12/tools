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

ActiveRecord::Schema.define(version: 2020_01_02_235531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_categories", force: :cascade do |t|
    t.string "name"
    t.integer "budget_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_budget_categories_on_user_id"
  end

  create_table "resolution_updates", force: :cascade do |t|
    t.bigint "resolution_id"
    t.string "title"
    t.string "description"
    t.datetime "date"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resolution_id"], name: "index_resolution_updates_on_resolution_id"
  end

  create_table "resolutions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "short_description"
    t.string "full_description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_resolutions_on_user_id"
  end

  create_table "time_tracker_sessions", force: :cascade do |t|
    t.bigint "time_tracker_id"
    t.datetime "clocked_in"
    t.datetime "clocked_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_tracker_id"], name: "index_time_tracker_sessions_on_time_tracker_id"
  end

  create_table "time_trackers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "seconds_worked"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_time_trackers_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "budget_category_id"
    t.bigint "user_id"
    t.index ["budget_category_id"], name: "index_transactions_on_budget_category_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
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

end
