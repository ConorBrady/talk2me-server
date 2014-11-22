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

ActiveRecord::Schema.define(version: 20141122122920) do

  create_table "conversation_messages", force: true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "decision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversation_messages", ["decision_id"], name: "index_conversation_messages_on_decision_id"
  add_index "conversation_messages", ["user_id"], name: "index_conversation_messages_on_user_id"

  create_table "decisions", force: true do |t|
    t.integer  "problem_id"
    t.integer  "user_id"
    t.integer  "outcome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decisions", ["problem_id"], name: "index_decisions_on_problem_id"
  add_index "decisions", ["user_id"], name: "index_decisions_on_user_id"

  create_table "problems", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["user_id"], name: "index_problems_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
