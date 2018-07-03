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

ActiveRecord::Schema.define(version: 20180702210454) do

  create_table "employments", force: :cascade do |t|
    t.string "name"
    t.string "current_company"
    t.string "ctc"
    t.string "ectc"
    t.string "total_experience"
    t.string "relevent_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resume_file_name"
    t.string "resume_content_type"
    t.integer "resume_file_size"
    t.datetime "resume_updated_at"
    t.integer "opening_id"
    t.integer "user_id"
    t.index ["opening_id"], name: "index_employments_on_opening_id"
    t.index ["user_id"], name: "index_employments_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "title"
    t.datetime "date_range"
    t.datetime "start"
    t.datetime "end"
    t.string "status"
    t.string "color"
    t.integer "employment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_id"], name: "index_interviews_on_employment_id"
  end

  create_table "openings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "role"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_openings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
