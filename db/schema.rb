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

ActiveRecord::Schema.define(version: 20160127092010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "beppucomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "beppupost_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "beppucomments", ["beppupost_id"], name: "index_beppucomments_on_beppupost_id", using: :btree
  add_index "beppucomments", ["student_id"], name: "index_beppucomments_on_student_id", using: :btree

  create_table "beppuposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "beppuposts", ["student_id"], name: "index_beppuposts_on_student_id", using: :btree

  create_table "chinacomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "chinapost_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "chinacomments", ["chinapost_id"], name: "index_chinacomments_on_chinapost_id", using: :btree
  add_index "chinacomments", ["student_id"], name: "index_chinacomments_on_student_id", using: :btree

  create_table "chinaposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "chinaposts", ["student_id"], name: "index_chinaposts_on_student_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["student_id"], name: "index_comments_on_student_id", using: :btree

  create_table "eastcomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "eastpost_id"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "eastcomments", ["eastpost_id"], name: "index_eastcomments_on_eastpost_id", using: :btree
  add_index "eastcomments", ["student_id"], name: "index_eastcomments_on_student_id", using: :btree

  create_table "eastposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "eastposts", ["student_id"], name: "index_eastposts_on_student_id", using: :btree

  create_table "fukuokacomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "fukuokapost_id"
    t.integer  "student_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "fukuokacomments", ["fukuokapost_id"], name: "index_fukuokacomments_on_fukuokapost_id", using: :btree
  add_index "fukuokacomments", ["student_id"], name: "index_fukuokacomments_on_student_id", using: :btree

  create_table "fukuokaposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "fukuokaposts", ["student_id"], name: "index_fukuokaposts_on_student_id", using: :btree

  create_table "missions", force: :cascade do |t|
    t.text     "title"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "missions", ["student_id"], name: "index_missions_on_student_id", using: :btree

  create_table "osakacomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "osakapost_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "osakacomments", ["osakapost_id"], name: "index_osakacomments_on_osakapost_id", using: :btree
  add_index "osakacomments", ["student_id"], name: "index_osakacomments_on_student_id", using: :btree

  create_table "osakaposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "osakaposts", ["student_id"], name: "index_osakaposts_on_student_id", using: :btree

  create_table "othercomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "otherpost_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "othercomments", ["otherpost_id"], name: "index_othercomments_on_otherpost_id", using: :btree
  add_index "othercomments", ["student_id"], name: "index_othercomments_on_student_id", using: :btree

  create_table "otherposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "otherposts", ["student_id"], name: "index_otherposts_on_student_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "posts", ["student_id"], name: "index_posts_on_student_id", using: :btree

  create_table "southcomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "southpost_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "southcomments", ["southpost_id"], name: "index_southcomments_on_southpost_id", using: :btree
  add_index "southcomments", ["student_id"], name: "index_southcomments_on_student_id", using: :btree

  create_table "southposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "southposts", ["student_id"], name: "index_southposts_on_student_id", using: :btree

  create_table "studentcomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "author_email"
    t.integer  "author_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "studentcomments", ["student_id"], name: "index_studentcomments_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "school"
    t.string   "major"
    t.string   "city"
    t.string   "nationality"
    t.text     "introduction"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "work"
    t.string   "pay"
    t.text     "gift"
    t.text     "mission"
  end

  add_index "students", ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "thaicomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "thaipost_id"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "thaicomments", ["student_id"], name: "index_thaicomments_on_student_id", using: :btree
  add_index "thaicomments", ["thaipost_id"], name: "index_thaicomments_on_thaipost_id", using: :btree

  create_table "thaiposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "thaiposts", ["student_id"], name: "index_thaiposts_on_student_id", using: :btree

  create_table "tokyocomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "tokyopost_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tokyocomments", ["student_id"], name: "index_tokyocomments_on_student_id", using: :btree
  add_index "tokyocomments", ["tokyopost_id"], name: "index_tokyocomments_on_tokyopost_id", using: :btree

  create_table "tokyoposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "tokyoposts", ["student_id"], name: "index_tokyoposts_on_student_id", using: :btree

  create_table "vietcomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "vietpost_id"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "vietcomments", ["student_id"], name: "index_vietcomments_on_student_id", using: :btree
  add_index "vietcomments", ["vietpost_id"], name: "index_vietcomments_on_vietpost_id", using: :btree

  create_table "vietposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "vietposts", ["student_id"], name: "index_vietposts_on_student_id", using: :btree

  add_foreign_key "beppucomments", "beppuposts"
  add_foreign_key "beppucomments", "students"
  add_foreign_key "beppuposts", "students"
  add_foreign_key "chinacomments", "chinaposts"
  add_foreign_key "chinacomments", "students"
  add_foreign_key "chinaposts", "students"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "students"
  add_foreign_key "eastcomments", "eastposts"
  add_foreign_key "eastcomments", "students"
  add_foreign_key "eastposts", "students"
  add_foreign_key "fukuokacomments", "fukuokaposts"
  add_foreign_key "fukuokacomments", "students"
  add_foreign_key "fukuokaposts", "students"
  add_foreign_key "missions", "students"
  add_foreign_key "osakacomments", "osakaposts"
  add_foreign_key "osakacomments", "students"
  add_foreign_key "osakaposts", "students"
  add_foreign_key "othercomments", "otherposts"
  add_foreign_key "othercomments", "students"
  add_foreign_key "otherposts", "students"
  add_foreign_key "posts", "students"
  add_foreign_key "southcomments", "southposts"
  add_foreign_key "southcomments", "students"
  add_foreign_key "southposts", "students"
  add_foreign_key "studentcomments", "students"
  add_foreign_key "thaicomments", "students"
  add_foreign_key "thaicomments", "thaiposts"
  add_foreign_key "thaiposts", "students"
  add_foreign_key "tokyocomments", "students"
  add_foreign_key "tokyocomments", "tokyoposts"
  add_foreign_key "tokyoposts", "students"
  add_foreign_key "vietcomments", "students"
  add_foreign_key "vietcomments", "vietposts"
  add_foreign_key "vietposts", "students"
end
