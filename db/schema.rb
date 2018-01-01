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

ActiveRecord::Schema.define(version: 20180101041028) do

  create_table "angkutans", force: :cascade do |t|
    t.string "plat_nomor"
    t.string "rute_awal"
    t.string "jalur"
    t.string "rute_akhir"
    t.integer "tipe_angkutan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipe_angkutan_id"], name: "index_angkutans_on_tipe_angkutan_id"
  end

  create_table "lewats", force: :cascade do |t|
    t.integer "angkutan_id"
    t.boolean "pulang"
    t.integer "road_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "urutan"
    t.index ["angkutan_id"], name: "index_lewats_on_angkutan_id"
    t.index ["road_id"], name: "index_lewats_on_road_id"
  end

  create_table "roads", force: :cascade do |t|
    t.string "nama"
    t.float "lat_awal"
    t.float "long_awal"
    t.float "lat_akhir"
    t.float "long_akhir"
    t.boolean "searah", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipe_angkutans", force: :cascade do |t|
    t.string "tipe"
    t.integer "ongkos"
    t.boolean "flat", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
