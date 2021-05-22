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

ActiveRecord::Schema.define(version: 2021_05_22_143421) do

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_comments_on_image_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favourites", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "image_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_favourites_on_image_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "images", charset: "utf8mb4", force: :cascade do |t|
    t.string "path"
    t.string "mime"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "image_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_tags_on_image_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "salt"
  end

  add_foreign_key "comments", "images"
  add_foreign_key "comments", "users"
  add_foreign_key "favourites", "images"
  add_foreign_key "favourites", "users"
  add_foreign_key "images", "users"
  add_foreign_key "tags", "images"
end
