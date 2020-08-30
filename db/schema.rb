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

ActiveRecord::Schema.define(version: 2020_08_26_040221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loan_updates", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.integer "status"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id"], name: "index_loan_updates_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", default: 0
    t.decimal "initial_amount", null: false
    t.integer "interest_type", default: 0
    t.decimal "interest_rate", null: false
    t.integer "period_type", default: 0
    t.integer "periods_count", null: false
    t.datetime "disbursed_at"
    t.integer "pay_day_deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "payment_updates", force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.integer "status"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_id"], name: "index_payment_updates_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.integer "status", default: 0
    t.text "note"
    t.decimal "principal_amount"
    t.decimal "interest_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
    t.string "email", null: false
    t.string "full_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "zip_code"
    t.string "mobile_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "recovery_password_digest"
  end

  add_foreign_key "loan_updates", "loans"
  add_foreign_key "loans", "users"
  add_foreign_key "payment_updates", "payments"
  add_foreign_key "payments", "loans"
end
