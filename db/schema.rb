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

ActiveRecord::Schema.define(version: 20141115180040) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "e_answers", force: true do |t|
    t.integer  "e_question_id"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rehearsal_id"
  end

  create_table "e_questions", force: true do |t|
    t.integer  "exercise_id"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercise_taggings", ["exercise_id"], name: "index_exercise_taggings_on_exercise_id"
  add_index "exercise_taggings", ["tag_id"], name: "index_exercise_taggings_on_tag_id"

  create_table "exercises", force: true do |t|
    t.string   "title"
    t.string   "general_description"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "global"
  end

  create_table "meditation_taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "meditation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meditation_taggings", ["meditation_id"], name: "index_meditation_taggings_on_meditation_id"
  add_index "meditation_taggings", ["tag_id"], name: "index_meditation_taggings_on_tag_id"

  create_table "meditations", force: true do |t|
    t.string   "title"
    t.text     "passage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "rehearsals", force: true do |t|
    t.integer  "tally"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exercise_id"
    t.integer  "user_id"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
