# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_170_801_062_734) do
  create_table 'books', force: :cascade do |t|
    t.string 'name'
    t.integer 'publisher_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['publisher_id'], name: 'index_books_on_publisher_id'
  end

  create_table 'publishers', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'stocks', force: :cascade do |t|
    t.integer 'amount', default: 1
    t.integer 'store_id'
    t.integer 'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_stocks_on_book_id'
    t.index ['store_id'], name: 'index_stocks_on_store_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
