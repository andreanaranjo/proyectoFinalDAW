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

ActiveRecord::Schema.define(version: 2019_02_10_171947) do

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "fulltext"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_announcements_on_member_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "member_id"
    t.integer "task_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_assignments_on_member_id"
    t.index ["task_id"], name: "index_assignments_on_task_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "due_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.date "dob"
    t.date "date_ingreso"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_members_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.string "content"
    t.integer "post_id"
    t.string "author"
    t.integer "member_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_post_comments_on_member_id"
    t.index ["post_id"], name: "index_post_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "member_id"
    t.text "content"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_posts_on_member_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "deadline"
    t.integer "event_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tasks_on_event_id"
  end

end
