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

ActiveRecord::Schema.define(version: 20171017025940) do

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "posts"
    t.string "likes"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "rtype"
    t.string "image"
    t.string "text"
    t.string "theme"
  end

  create_table "users", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.string "email"
    t.string "username"
    t.string "password"
  end

end