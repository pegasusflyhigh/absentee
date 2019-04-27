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

ActiveRecord::Schema.define(version: 2019_04_27_054314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_entries", force: :cascade do |t|
    t.boolean "is_present", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attendance_sheet_id"
    t.bigint "student_id"
    t.bigint "updated_by_id"
    t.index ["attendance_sheet_id"], name: "index_attendance_entries_on_attendance_sheet_id"
    t.index ["student_id"], name: "index_attendance_entries_on_student_id"
    t.index ["updated_by_id"], name: "index_attendance_entries_on_updated_by_id"
  end

  create_table "attendance_sheets", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "standard_id"
    t.index ["standard_id"], name: "index_attendance_sheets_on_standard_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "registration_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sms_details", force: :cascade do |t|
    t.string "status"
    t.text "failure_message"
    t.bigint "attendance_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_entry_id"], name: "index_sms_details_on_attendance_entry_id"
  end

  create_table "standards", force: :cascade do |t|
    t.string "grade"
    t.string "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_standards_on_school_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "roll_number"
    t.string "name"
    t.string "primary_number"
    t.string "secondary_number"
    t.string "preferred_language", default: "English"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "standard_id"
    t.boolean "active"
    t.index ["standard_id"], name: "index_students_on_standard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "mobile_number"
    t.boolean "active"
    t.bigint "school_id"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "attendance_entries", "attendance_sheets"
  add_foreign_key "attendance_entries", "students"
  add_foreign_key "attendance_entries", "users", column: "updated_by_id"
  add_foreign_key "attendance_sheets", "standards"
  add_foreign_key "sms_details", "attendance_entries"
  add_foreign_key "standards", "schools"
  add_foreign_key "students", "standards"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "schools"
end
