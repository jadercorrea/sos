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

ActiveRecord::Schema.define(:version => 20130223160417) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_orders", :force => true do |t|
    t.integer  "client_id"
    t.string   "module"
    t.string   "project"
    t.date     "date"
    t.string   "reason"
    t.string   "requestor"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "non_billable_hours"
    t.string   "other_billable_hours"
    t.text     "description"
    t.text     "comment"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "user_id"
  end

  add_index "service_orders", ["client_id"], :name => "index_service_orders_on_client_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "mail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
