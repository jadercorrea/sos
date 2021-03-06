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

ActiveRecord::Schema.define(version: 20131124040815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_datetime"
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticket_id"
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree
  add_index "events", ["ticket_id"], name: "index_events_on_ticket_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_orders", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "total_time"
  end

  add_index "service_orders", ["client_id"], name: "index_service_orders_on_client_id", using: :btree

  create_table "ticket_messages", force: true do |t|
    t.string   "text"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "ticket_messages", ["ticket_id"], name: "index_ticket_messages_on_ticket_id", using: :btree
  add_index "ticket_messages", ["user_id"], name: "index_ticket_messages_on_user_id", using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "tickets", ["client_id"], name: "index_tickets_on_client_id", using: :btree
  add_index "tickets", ["status"], name: "index_tickets_on_status", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.integer  "client_id"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
