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

ActiveRecord::Schema.define(version: 20141125223056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "answers", force: true do |t|
    t.text     "body"
    t.boolean  "is_correct"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.integer  "headchapter_id"
    t.integer  "weight"
    t.string   "codename"
  end

  create_table "exams", force: true do |t|
    t.string   "title"
    t.string   "codename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_definitions", force: true do |t|
    t.string   "question_text"
    t.hstore   "variables"
    t.string   "first_answer"
    t.string   "second_answer"
    t.string   "third_answer"
    t.string   "correct_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapter_id"
  end

  create_table "questions", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapter_id"
    t.integer  "difficulty"
    t.string   "question_image"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
