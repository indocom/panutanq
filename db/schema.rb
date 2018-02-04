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

ActiveRecord::Schema.define(version: 20180204071810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_admins_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_admins_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "events", force: :cascade do |t|
    t.bigint   "category_id", :index=>{:name=>"index_events_on_category_id"}
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "name"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint   "event_id",   :index=>{:name=>"index_pictures_on_event_id"}
    t.bigint   "post_id",    :index=>{:name=>"index_pictures_on_post_id"}
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint   "category_id", :index=>{:name=>"index_posts_on_category_id"}
    t.string   "name"
    t.text     "description"
    t.bigint   "event_id",    :index=>{:name=>"index_posts_on_event_id"}
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  add_foreign_key "events", "categories"
  add_foreign_key "pictures", "events"
  add_foreign_key "pictures", "posts"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "events"
end