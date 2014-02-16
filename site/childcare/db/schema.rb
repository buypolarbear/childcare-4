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

ActiveRecord::Schema.define(version: 20140216213529) do

  create_table "expenses", force: true do |t|
    t.string   "type"
    t.decimal  "amount"
    t.integer  "percent_home_useage"
    t.integer  "vehicle_id"
    t.decimal  "vehicle_mileage"
    t.datetime "date"
    t.string   "description"
    t.decimal  "depreciation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.decimal  "sq_foot_total"
    t.decimal  "sq_foot_used"
    t.decimal  "time_used"
    t.decimal  "depreciation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incomes", force: true do |t|
    t.string   "tpye"
    t.decimal  "amount"
    t.datetime "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
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
  end

  create_table "vehicles", force: true do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "license"
    t.decimal  "depreciation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
