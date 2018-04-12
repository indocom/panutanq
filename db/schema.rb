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

ActiveRecord::Schema.define(version: 20180409092834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "events", force: :cascade do |t|
    t.bigint   "category_id", :index=>{:name=>"index_events_on_category_id"}
    t.text     "description"
    t.string   "name"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
    t.date     "start_time"
    t.date     "end_time"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "anonymous",  :default=>true
    t.text     "message"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint   "event_id",             :index=>{:name=>"index_pictures_on_event_id"}
    t.datetime "created_at",           :null=>false
    t.datetime "updated_at",           :null=>false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          :index=>{:name=>"index_roles_on_name_and_resource_type_and_resource_id", :with=>["resource_type", "resource_id"]}
    t.string   "resource_type", :index=>{:name=>"index_roles_on_resource_type_and_resource_id", :with=>["resource_id"]}
    t.bigint   "resource_id"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",          :default=>"", :null=>false
    t.string   "reset_password_token",        :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                  :null=>false
    t.datetime "updated_at",                  :null=>false
    t.string   "fullname"
    t.string   "contact_number"
    t.string   "major"
    t.date     "graduation"
    t.string   "overseas_experience"
    t.string   "work_experience"
    t.boolean  "display_email"
    t.boolean  "display_contact_number"
    t.boolean  "display_major"
    t.boolean  "display_graduation"
    t.boolean  "display_overseas_experience"
    t.boolean  "display_work_experience"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id", :index=>{:name=>"index_users_roles_on_user_id"}
    t.bigint "role_id", :index=>{:name=>"index_users_roles_on_role_id"}

    t.index ["user_id", "role_id"], :name=>"index_users_roles_on_user_id_and_role_id"
  end

  add_foreign_key "events", "categories"
  add_foreign_key "pictures", "events"
end
