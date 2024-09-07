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

ActiveRecord::Schema[7.2].define(version: 2024_09_07_234819) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "print_offers", force: :cascade do |t|
    t.bigint "print_request_id", null: false
    t.bigint "printer_id", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.date "estimated_completion_date", null: false
    t.text "notes"
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_request_id"], name: "index_print_offers_on_print_request_id"
    t.index ["printer_id"], name: "index_print_offers_on_printer_id"
    t.index ["status"], name: "index_print_offers_on_status"
  end

  create_table "print_requests", force: :cascade do |t|
    t.bigint "requester_id", null: false
    t.string "description", null: false
    t.string "file_url", null: false
    t.string "material"
    t.string "color"
    t.decimal "max_price", precision: 10, scale: 2
    t.date "needed_by"
    t.string "status", default: "open", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requester_id"], name: "index_print_requests_on_requester_id"
    t.index ["status"], name: "index_print_requests_on_status"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "reviewer_id", null: false
    t.bigint "reviewed_id", null: false
    t.bigint "print_request_id", null: false
    t.integer "rating", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_request_id"], name: "index_reviews_on_print_request_id"
    t.index ["reviewed_id"], name: "index_reviews_on_reviewed_id"
    t.index ["reviewer_id", "print_request_id"], name: "index_reviews_on_reviewer_and_print_request", unique: true
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.string "location"
    t.boolean "is_printer", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "print_offers", "print_requests"
  add_foreign_key "print_offers", "users", column: "printer_id"
  add_foreign_key "print_requests", "users", column: "requester_id"
  add_foreign_key "reviews", "print_requests"
  add_foreign_key "reviews", "users", column: "reviewed_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
