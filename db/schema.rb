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

ActiveRecord::Schema.define(version: 20160802020545) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.integer  "max_loan"
  end

  create_table "notices", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer  "title_id"
    t.string   "borrower"
    t.text     "note"
    t.string   "agent"
    t.datetime "out"
    t.datetime "in"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "due"
    t.datetime "return_approved"
    t.index ["title_id"], name: "index_records_on_title_id"
  end

  create_table "titles", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.integer  "n_available"
    t.boolean  "form_required"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "max_loan"
    t.integer  "notice_id"
    t.integer  "office_id"
    t.index ["category_id"], name: "index_titles_on_category_id"
    t.index ["notice_id"], name: "index_titles_on_notice_id"
    t.index ["office_id"], name: "index_titles_on_office_id"
  end

end
