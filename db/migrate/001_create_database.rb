class CreateDatabase < ActiveRecord::Migration
  def self.up
   create_table "categories", force: true do |t|
    t.string "label"
  end

  create_table "order_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "order_rows", force: true do |t|
    t.integer "order_id"
    t.integer "product_id"
  end

  create_table "order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "order_code"
    t.integer  "sale_id"
    t.string   "status"
    t.integer  "buyer_address_id"
    t.datetime "created_at"
    t.decimal  "subtotal",         precision: 10, scale: 0
    t.decimal  "tax",              precision: 10, scale: 0
    t.decimal  "shipping",         precision: 10, scale: 0
    t.decimal  "total",            precision: 10, scale: 0
    t.integer  "order_status_id"
    t.integer  "user_id",                                   null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "label"
    t.decimal  "price",              precision: 10, scale: 0
    t.decimal  "special_price",      precision: 10, scale: 0
    t.text     "description"
    t.integer  "stock"
    t.integer  "category_id"
    t.integer  "sale_id"
    t.integer  "supplier_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sales", force: true do |t|
    t.datetime "start_datetime",                          null: false
    t.datetime "end_datetime",                            null: false
    t.string   "label"
    t.text     "description"
    t.decimal  "shipping_fees",  precision: 10, scale: 0
  end

  create_table "suppliers", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "last_name",                                       null: false
    t.string   "first_name",                                      null: false
    t.string   "email",                                           null: false
    t.string   "password_digest",                                 null: false
    t.string   "role"
    t.string   "username",                                        null: false
    t.datetime "created_at",      default: '2015-08-25 09:53:14'
    t.integer  "newsletter",      default: 1
    t.string   "salt"
  end
  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end