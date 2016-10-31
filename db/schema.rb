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

ActiveRecord::Schema.define(version: 20161031141625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: true do |t|
    t.float    "cost_value"
    t.float    "sale_value"
    t.string   "name"
    t.integer  "quantity_in_stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "client_name"
    t.float    "value"
    t.float    "discount"
    t.float    "final_value"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks_products", force: true do |t|
    t.integer  "task_id"
    t.integer  "product_id"
    t.string   "file_name"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "obs"
  end

  add_index "tasks_products", ["product_id"], name: "index_tasks_products_on_product_id", using: :btree
  add_index "tasks_products", ["task_id"], name: "index_tasks_products_on_task_id", using: :btree

end
