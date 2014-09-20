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

ActiveRecord::Schema.define(version: 20140920163121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "course_code"
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.datetime "published_date"
    t.string   "seller_name"
    t.string   "seller_email"
    t.string   "seller_phone_number"
    t.boolean  "verified",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["course_code"], name: "index_books_on_course_code", using: :btree
  add_index "books", ["seller_email"], name: "index_books_on_seller_email", using: :btree

end
