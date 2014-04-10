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

ActiveRecord::Schema.define(version: 20140410051154) do

  create_table "calenders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_events", force: true do |t|
    t.integer  "child_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "actual_start"
    t.datetime "actual_end"
    t.integer  "parent_id"
  end

  add_index "child_events", ["child_id"], name: "index_child_events_on_child_id"

  create_table "children", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rate_id"
  end

  add_index "children", ["id"], name: "index_children_on_id"

  create_table "children_parents", force: true do |t|
    t.integer "child_id"
    t.integer "parent_id"
  end

  add_index "children_parents", ["id"], name: "index_children_parents_on_id"

  create_table "documents", force: true do |t|
    t.string  "category"
    t.string  "title"
    t.string  "path"
    t.date    "expiration"
    t.integer "user_id"
    t.integer "file_size"
  end

  add_index "documents", ["title"], name: "index_documents_on_title"

  create_table "events", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "description"
    t.boolean  "notify"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["id"], name: "index_events_on_id"

  create_table "expenses", force: true do |t|
    t.string   "expense_type"
    t.decimal  "amount"
    t.integer  "vehicle_id"
    t.decimal  "vehicle_mileage"
    t.datetime "date"
    t.string   "description"
    t.decimal  "depreciation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.decimal  "percent_home_usage"
  end

  add_index "expenses", ["date"], name: "index_expenses_on_date"

  create_table "facilities", force: true do |t|
    t.decimal  "sq_foot_total"
    t.decimal  "sq_foot_used"
    t.decimal  "time_used"
    t.decimal  "depreciation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
  end

  add_index "facilities", ["name"], name: "index_facilities_on_name"

  create_table "income_payments", force: true do |t|
    t.datetime "date_paid"
    t.decimal  "amount_paid"
    t.integer  "parent_id"
    t.integer  "income_id"
    t.string   "type"
  end

  add_index "income_payments", ["id"], name: "index_income_payments_on_id"

  create_table "incomes", force: true do |t|
    t.decimal  "amount"
    t.datetime "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "income_type"
    t.boolean  "paid"
    t.string   "owed_by"
    t.decimal  "amount_paid"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_index "incomes", ["date"], name: "index_incomes_on_date"

  create_table "parents", force: true do |t|
    t.string  "email"
    t.string  "fname"
    t.string  "lname"
    t.string  "phone_home"
    t.string  "phone_cell"
    t.string  "phone_work"
    t.string  "street_addr"
    t.string  "city"
    t.string  "state"
    t.integer "zip"
  end

  add_index "parents", ["id"], name: "index_parents_on_id"

  create_table "rates", force: true do |t|
    t.string   "name"
    t.decimal  "rate_per_unit"
    t.integer  "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["name"], name: "index_rates_on_name"

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
    t.string   "lname"
    t.string   "mname"
    t.integer  "ssn"
    t.integer  "phone_home"
    t.integer  "phone_cell"
    t.integer  "phone_work"
    t.string   "street_addr"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "user_type"
    t.string   "trusted_one"
    t.string   "trusted_two"
    t.string   "trusted_three"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "vehicles", force: true do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "license"
    t.decimal  "depreciation_rate"
    t.datetime "created_at"
    t.integer  "user_id"
  end

  add_index "vehicles", ["license"], name: "index_vehicles_on_license"

end
