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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120725072444) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id", :null => false
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "buckets", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "report_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "report_id",  :null => false
    t.integer  "rate"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "first_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "thumb_img_file_name"
    t.string   "thumb_img_content_type"
    t.integer  "thumb_img_file_size"
    t.datetime "thumb_img_updated_at"
    t.string   "content_img_file_name"
    t.string   "content_img_content_type"
    t.integer  "content_img_file_size"
    t.datetime "content_img_updated_at"
  end

  create_table "packages_reports", :id => false, :force => true do |t|
    t.integer "package_id"
    t.integer "report_id"
  end

  create_table "purchases", :id => false, :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "report_id",  :null => false
    t.boolean  "isFeedback"
    t.boolean  "isPaid"
    t.integer  "type",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reports", :force => true do |t|
    t.integer  "user_id",                :null => false
    t.string   "title"
    t.string   "univ"
    t.string   "college"
    t.string   "dep"
    t.integer  "year"
    t.integer  "price"
    t.integer  "page"
    t.integer  "hit"
    t.integer  "rate"
    t.text     "intro"
    t.text     "list"
    t.text     "content"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "document1_file_name"
    t.string   "document1_content_type"
    t.integer  "document1_file_size"
    t.datetime "document1_updated_at"
    t.string   "document2_file_name"
    t.string   "document2_content_type"
    t.integer  "document2_file_size"
    t.datetime "document2_updated_at"
    t.string   "document3_file_name"
    t.string   "document3_content_type"
    t.integer  "document3_file_size"
    t.datetime "document3_updated_at"
    t.string   "document4_file_name"
    t.string   "document4_content_type"
    t.integer  "document4_file_size"
    t.datetime "document4_updated_at"
    t.string   "document5_file_name"
    t.string   "document5_content_type"
    t.integer  "document5_file_size"
    t.datetime "document5_updated_at"
  end

  create_table "second_categories", :force => true do |t|
    t.integer  "first_category_id", :null => false
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sellers", :force => true do |t|
    t.integer  "user_id",             :null => false
    t.string   "name",                :null => false
    t.integer  "rate"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "statistics", :id => false, :force => true do |t|
    t.integer  "total_user"
    t.integer  "total_page"
    t.integer  "sold_page"
    t.integer  "total_income"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "payer_name"
    t.string   "bank"
    t.string   "tel"
    t.boolean  "freepass",               :default => false, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
