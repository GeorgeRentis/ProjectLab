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

ActiveRecord::Schema.define(version: 20160207184320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_messages", force: :cascade do |t|
    t.string   "first_name"
    t.string   "string"
    t.string   "last_name"
    t.string   "subject"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "read",       default: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string   "first_name"
    t.string   "string"
    t.string   "last_name"
    t.string   "subject"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "upload"
    t.string   "uploadable_type"
    t.integer  "uploadable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["uploadable_id", "uploadable_type"], name: "index_images_on_uploadable_id_and_uploadable_type", using: :btree
    t.index ["uploadable_id"], name: "index_images_on_uploadable_id", using: :btree
    t.index ["uploadable_type"], name: "index_images_on_uploadable_type", using: :btree
  end

  create_table "lesson_ratings", force: :cascade do |t|
    t.integer  "communication"
    t.integer  "quality"
    t.integer  "teaching"
    t.integer  "general_grade"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.integer  "avg"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "description"
    t.string   "title"
    t.integer  "category_id"
    t.string   "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "slug"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "title"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "read",        default: false
    t.string   "slug"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "msg"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "upload"
    t.string   "uploadable_type"
    t.integer  "uploadable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["uploadable_id", "uploadable_type"], name: "index_uploads_on_uploadable_id_and_uploadable_type", using: :btree
    t.index ["uploadable_id"], name: "index_uploads_on_uploadable_id", using: :btree
    t.index ["uploadable_type"], name: "index_uploads_on_uploadable_type", using: :btree
  end

  create_table "user_images", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "user_ratings", force: :cascade do |t|
    t.integer  "communication"
    t.integer  "quality"
    t.integer  "teaching"
    t.integer  "general_grade"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.integer  "avg"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                                                                                              null: false
    t.string   "encrypted_password",     default: "",                                                                                                              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                                                               null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.integer  "role_id",                default: 1
    t.string   "slug"
    t.string   "default_avatar",         default: "https://cdn4.iconfinder.com/data/icons/info-graphics-4-glyph-free/64/one_user_data_graphic_info_infos-256.png"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
