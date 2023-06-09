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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_134246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "groups_id", null: false
    t.bigint "purchases_id", null: false
    t.index ["groups_id"], name: "index_group_purchases_on_groups_id"
    t.index ["purchases_id"], name: "index_group_purchases_on_purchases_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_groups_on_author_id"
  end

  create_table "groups_purchases", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "purchase_id", null: false
    t.index ["group_id", "purchase_id"], name: "index_groups_purchases_on_group_id_and_purchase_id"
    t.index ["purchase_id", "group_id"], name: "index_groups_purchases_on_purchase_id_and_group_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_purchases_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "group_purchases", "groups", column: "groups_id"
  add_foreign_key "group_purchases", "purchases", column: "purchases_id"
  add_foreign_key "groups", "users", column: "author_id"
  add_foreign_key "groups_purchases", "groups"
  add_foreign_key "groups_purchases", "purchases"
  add_foreign_key "purchases", "users", column: "author_id"
end
