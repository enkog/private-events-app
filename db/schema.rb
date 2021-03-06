# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_302_100_143) do
  create_table 'event_users', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'event_id', null: false
    t.index ['event_id'], name: 'index_event_users_on_event_id'
    t.index ['user_id'], name: 'index_event_users_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'location'
    t.date 'date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'creator_id'
    t.index ['creator_id'], name: 'index_events_on_creator_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
  end

  add_foreign_key 'event_users', 'events'
  add_foreign_key 'event_users', 'users'
  add_foreign_key 'events', 'users', column: 'creator_id'
end
