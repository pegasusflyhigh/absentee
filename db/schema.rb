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

ActiveRecord::Schema.define(version: 2019_04_26_153555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.string "connection_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "remark"
    t.boolean "is_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_type"
    t.bigint "source_id"
    t.bigint "user_id"
    t.string "role"
    t.index ["source_type", "source_id"], name: "index_feedbacks_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "product_connections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "input_id"
    t.bigint "output_id"
    t.bigint "connection_id"
    t.text "description"
    t.index ["connection_id"], name: "index_product_connections_on_connection_id"
    t.index ["input_id", "output_id", "connection_id", "description"], name: "index_on_product_connections", unique: true
    t.index ["input_id"], name: "index_product_connections_on_input_id"
    t.index ["output_id"], name: "index_product_connections_on_output_id"
  end

  create_table "product_suites", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_product_suites_on_owner_id"
  end

  create_table "product_suites_with_interested_people", id: false, force: :cascade do |t|
    t.bigint "product_suite_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_links"
    t.bigint "owner_id"
    t.bigint "product_suite_id"
    t.index ["owner_id"], name: "index_products_on_owner_id"
    t.index ["product_suite_id"], name: "index_products_on_product_suite_id"
  end

  create_table "products_used_by_users", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "products_with_interested_people", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "registration_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_completions", force: :cascade do |t|
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_task_completions_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "status"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_links"
    t.bigint "creator_id"
    t.string "source_type"
    t.bigint "source_id"
    t.bigint "owner_id"
    t.bigint "end_user_id"
    t.bigint "assigned_person_id"
    t.index ["assigned_person_id"], name: "index_tasks_on_assigned_person_id"
    t.index ["creator_id"], name: "index_tasks_on_creator_id"
    t.index ["end_user_id"], name: "index_tasks_on_end_user_id"
    t.index ["owner_id"], name: "index_tasks_on_owner_id"
    t.index ["source_type", "source_id"], name: "index_tasks_on_source_type_and_source_id"
  end

  create_table "tasks_users", force: :cascade do |t|
    t.integer "priority", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "task_id"
    t.index ["task_id"], name: "index_tasks_users_on_task_id"
    t.index ["user_id"], name: "index_tasks_users_on_user_id"
  end

  create_table "tasks_with_interested_people", id: false, force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "short_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "feedbacks", "users"
  add_foreign_key "products", "product_suites"
  add_foreign_key "task_completions", "tasks"
end
