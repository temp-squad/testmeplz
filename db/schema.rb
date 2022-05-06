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

ActiveRecord::Schema[7.0].define(version: 2022_05_06_073351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "candidates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_candidates_on_company_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.uuid "exam_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_comments_on_exam_id"
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_members_on_company_id"
    t.index ["user_id"], name: "index_company_members_on_user_id"
  end

  create_table "company_tests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_tests_on_company_id"
    t.index ["test_id"], name: "index_company_tests_on_test_id"
  end

  create_table "exams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.uuid "user_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "test_answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "answer"
    t.uuid "exam_id", null: false
    t.uuid "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.index ["exam_id"], name: "index_test_answers_on_exam_id"
    t.index ["test_id"], name: "index_test_answers_on_test_id"
  end

  create_table "test_cases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "input"
    t.string "expected_return"
    t.uuid "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_test_cases_on_test_id"
  end

  create_table "test_languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "language"
    t.text "example"
    t.text "placeholder"
    t.uuid "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_test_languages_on_test_id"
  end

  create_table "test_set_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "test_id", null: false
    t.uuid "test_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_test_set_items_on_test_id"
    t.index ["test_set_id"], name: "index_test_set_items_on_test_set_id"
  end

  create_table "test_sets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["company_id"], name: "index_test_sets_on_company_id"
  end

  create_table "tests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "return_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "companies"
  add_foreign_key "candidates", "users"
  add_foreign_key "comments", "exams"
  add_foreign_key "company_members", "companies"
  add_foreign_key "company_members", "users"
  add_foreign_key "company_tests", "companies"
  add_foreign_key "company_tests", "tests"
  add_foreign_key "exams", "users"
  add_foreign_key "test_answers", "exams"
  add_foreign_key "test_answers", "tests"
  add_foreign_key "test_cases", "tests"
  add_foreign_key "test_languages", "tests"
  add_foreign_key "test_set_items", "test_sets"
  add_foreign_key "test_set_items", "tests"
  add_foreign_key "test_sets", "companies"
end
