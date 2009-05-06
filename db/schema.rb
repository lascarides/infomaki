# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090221202048) do

  create_table "answers", :force => true do |t|
    t.text     "body"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_sort_id"
  end

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_sort_id"
  end

  create_table "help_pages", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "initiatives", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "wireframe_id"
    t.boolean  "is_open_entry"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations_testees", :force => true do |t|
    t.integer "organization_id"
    t.integer "testee_id"
  end

  create_table "personas", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas_user_stories", :force => true do |t|
    t.integer "persona_id"
    t.integer "user_story_id"
  end

  create_table "questions", :force => true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_demographic"
    t.string   "style"
  end

  create_table "replies", :force => true do |t|
    t.string   "remote_ip"
    t.string   "session_id"
    t.integer  "initiative_id"
    t.integer  "coordinate_x"
    t.integer  "coordinate_y"
    t.text     "long_answer"
    t.string   "short_answer"
    t.integer  "reply_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "use_cases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "use_cases_user_stories", :force => true do |t|
    t.integer "use_case_id"
    t.integer "user_story_id"
  end

  create_table "user_stories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "email"
    t.boolean  "is_admin"
    t.boolean  "is_superuser"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wireframes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.boolean  "is_active"
  end

end
