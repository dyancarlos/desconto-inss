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

ActiveRecord::Schema[7.2].define(version: 2024_08_24_123401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.date "birthdate", null: false
    t.integer "salary_cents", default: 0, null: false
    t.string "salary_currency", default: "BRL", null: false
    t.integer "net_salary_cents", default: 0, null: false
    t.string "net_salary_currency", default: "BRL", null: false
    t.integer "social_security_discount_cents", default: 0, null: false
    t.string "social_security_discount_currency", default: "BRL", null: false
    t.string "street_name"
    t.integer "street_number"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "personal_phone", null: false
    t.string "reference_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_employees_on_cpf", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
