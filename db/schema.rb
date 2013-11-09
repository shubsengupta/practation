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

ActiveRecord::Schema.define(version: 20131109101141) do

  create_table "presentations", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "presentations", ["user_id"], name: "index_presentations_on_user_id", using: :btree

  create_table "slide_presentations", force: true do |t|
    t.integer "presentation_id"
  end

  add_index "slide_presentations", ["presentation_id"], name: "index_slide_presentations_on_presentation_id", using: :btree

  create_table "slideshow_slides", force: true do |t|
    t.integer "slide_presentation_id"
    t.string  "image"
    t.string  "text"
  end

  add_index "slideshow_slides", ["slide_presentation_id"], name: "index_slideshow_slides_on_slide_presentation_id", using: :btree

  create_table "text_presentations", force: true do |t|
    t.integer "presentation_id"
    t.string  "text"
  end

  add_index "text_presentations", ["presentation_id"], name: "index_text_presentations_on_presentation_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
