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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110106053131) do

  create_table "courses", :force => true do |t|
    t.integer  "program_id"
    t.integer  "teacher_id"
    t.integer  "location_id"
    t.string   "days_of_week"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost",         :precision => 10, :scale => 0
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "session_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "email"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.string   "language"
    t.string   "level"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.text     "experience"
    t.integer  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.datetime "birthday"
    t.string   "shirt_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "teachers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "cell_phone"
    t.string   "email"
    t.text     "bio"
    t.string   "shirt_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
