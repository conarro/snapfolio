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

ActiveRecord::Schema.define(:version => 20121207071410) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
    t.string   "secret"
  end

  create_table "education_items", :force => true do |t|
    t.integer  "linkedin_user_id"
    t.integer  "education_id"
    t.boolean  "is_web_visible",   :default => true
    t.boolean  "is_print_visible", :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "educations", :force => true do |t|
    t.string   "degree"
    t.string   "field_of_study"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "school_name"
    t.string   "education_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "github_users", :force => true do |t|
    t.string   "username"
    t.string   "photo_url"
    t.string   "profile_url"
    t.string   "profile_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "linkedin_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "headline"
    t.string   "photo_url"
    t.string   "email"
    t.string   "industry"
    t.string   "profile_url"
    t.string   "location_name"
    t.string   "location_country"
    t.string   "profile_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

  create_table "position_items", :force => true do |t|
    t.integer  "linkedin_user_id"
    t.integer  "position_id"
    t.boolean  "is_web_visible",   :default => true
    t.boolean  "is_print_visible", :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.string   "company"
    t.string   "company_id"
    t.boolean  "is_current"
    t.string   "position_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "repo_items", :force => true do |t|
    t.integer  "github_user_id"
    t.integer  "repo_id"
    t.boolean  "is_web_visible",   :default => true
    t.boolean  "is_print_visible", :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "repos", :force => true do |t|
    t.string   "repo_id"
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "pushed_at"
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
