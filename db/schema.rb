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

ActiveRecord::Schema.define(version: 20160104215136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: true do |t|
    t.integer  "student_id", null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["course_id"], name: "index_classrooms_on_course_id", using: :btree
  add_index "classrooms", ["student_id"], name: "index_classrooms_on_student_id", using: :btree

  create_table "courses", force: true do |t|
    t.string  "name",        null: false
    t.string  "description", null: false
    t.integer "status"
  end

  add_index "courses", ["name"], name: "index_courses_on_name", unique: true, using: :btree

  create_table "students", force: true do |t|
    t.string  "name",            null: false
    t.string  "register_number", null: false
    t.integer "status"
  end

  add_index "students", ["register_number"], name: "index_students_on_register_number", unique: true, using: :btree

end
