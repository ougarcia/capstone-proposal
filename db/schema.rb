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

ActiveRecord::Schema.define(version: 20150612032345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notebooks", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notebooks", ["user_id"], name: "index_notebooks_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "body"
    t.integer  "notebook_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notes", ["notebook_id"], name: "index_notes_on_notebook_id", using: :btree
  add_index "notes", ["title"], name: "index_notes_on_title", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "note_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["note_id"], name: "index_taggings_on_note_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["title"], name: "index_tags_on_title", using: :btree
  add_index "tags", ["user_id"], name: "index_tags_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "notebooks", "users"
  add_foreign_key "notes", "notebooks"
  add_foreign_key "taggings", "notes"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "users"
end
