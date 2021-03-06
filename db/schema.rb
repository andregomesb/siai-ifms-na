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

ActiveRecord::Schema.define(version: 20170911192831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "initial"
    t.index ["name", "initial"], name: "index_courses_on_name_and_initial"
  end

  create_table "incidents", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.integer "user_id"
    t.integer "institution"
    t.text "description"
    t.date "date_incident"
    t.text "soluction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.time "time_incident"
    t.integer "assistant_id"
    t.datetime "signed_in"
    t.integer "is_resolved"
    t.integer "type_student"
    t.integer "sanction"
    t.integer "school_group"
    t.index ["course_id"], name: "index_incidents_on_course_id"
    t.index ["date_incident"], name: "index_incidents_on_date_incident"
    t.index ["institution"], name: "index_incidents_on_institution"
    t.index ["student_id"], name: "index_incidents_on_student_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "keypasses", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "key"
    t.string "local_service"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user"
    t.integer "local"
    t.index ["title"], name: "index_keypasses_on_title"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "entity"
    t.boolean "can_create", default: false
    t.boolean "can_read", default: false
    t.boolean "can_update", default: false
    t.boolean "can_destroy", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "can_manage", default: false
    t.boolean "can_extras", default: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_positions_on_name"
  end

  create_table "sectors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "initial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "icon"
    t.index ["name", "initial", "slug"], name: "index_sectors_on_name_and_initial_and_slug"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "responsible"
    t.string "responsible_contact"
    t.string "contact"
    t.integer "ra"
    t.string "password"
    t.string "password_digest"
    t.string "enrollment"
    t.string "cpf"
    t.date "birth_date"
    t.integer "course_situation"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["name"], name: "index_students_on_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.string "name"
    t.integer "siape"
    t.integer "sector_id"
    t.bigint "position_id"
    t.string "avatar"
    t.bigint "course_id"
    t.boolean "admin", default: false
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sector_id"], name: "index_users_on_sector_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "incidents", "courses"
  add_foreign_key "incidents", "students"
  add_foreign_key "incidents", "users"
  add_foreign_key "permissions", "users"
  add_foreign_key "students", "courses"
  add_foreign_key "users", "courses"
  add_foreign_key "users", "positions"
  add_foreign_key "users", "sectors"
end
