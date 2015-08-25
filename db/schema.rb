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

ActiveRecord::Schema.define(version: 20150824185620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_comfort_interiors", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "comfort_interior_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "car_images", force: :cascade do |t|
    t.integer  "car_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "car_safety_features", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "safety_feature_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "year"
    t.integer  "mileage"
    t.decimal  "price"
    t.text     "car_location"
    t.string   "contact_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "color_id"
    t.integer  "interior_color_id"
    t.integer  "interior_design_id"
    t.integer  "gearbox_id"
    t.text     "report_other"
    t.integer  "report"
    t.integer  "car_make"
    t.integer  "car_model"
    t.integer  "user_id"
    t.integer  "fuel_type"
    t.integer  "cubic_capacity"
    t.boolean  "special_car"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comfort_interiors", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dealers", force: :cascade do |t|
    t.string   "gallery_name"
    t.text     "gallery_location"
    t.string   "street_name"
    t.string   "building_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "phone_number"
    t.string   "mobile_number"
    t.integer  "city"
    t.string   "name"
  end

  create_table "interior_colors", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interior_designs", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "models", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "safety_features", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "meta_id"
    t.string   "meta_type"
    t.boolean  "isadmin"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
