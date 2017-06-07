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

ActiveRecord::Schema.define(version: 20170605104540) do

  create_table "libcompls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "libindex", null: false
    t.integer "area_id"
    t.integer "question_index"
    t.string "compliance_task", null: false
    t.string "compliance_details"
    t.string "frequency"
    t.string "website_link"
    t.string "form_link"
    t.string "task_details"
    t.date "date"
    t.boolean "demo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
