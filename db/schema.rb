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

ActiveRecord::Schema.define(version: 20160420164108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canales", force: :cascade do |t|
    t.string   "canal_cod",   null: false
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "consultas", force: :cascade do |t|
    t.integer  "persona_id"
    t.text     "pregunta",      null: false
    t.text     "respuesta"
    t.integer  "id_canal_preg", null: false
    t.integer  "id_canal_resp"
    t.string   "login_alta",    null: false
    t.string   "estado",        null: false
    t.datetime "fh_respuesta"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "consultas", ["persona_id"], name: "index_xp_consultas_on_persona_id", using: :btree

  create_table "personas", force: :cascade do |t|
    t.integer  "persona_cod",            null: false
    t.string   "razon",                  null: false
    t.string   "tipo_doc",    limit: 5
    t.string   "nro_doc",     limit: 11
    t.string   "sexo",        limit: 2
    t.string   "login_alta",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "personas", ["persona_cod"], name: "index_xp_personas_on_persona_cod", using: :btree
  add_index "personas", ["razon"], name: "index_xp_personas_on_razon", using: :btree
  add_index "personas", ["tipo_doc", "nro_doc"], name: "index_xp_personas_on_tipo_doc_and_nro_doc", unique: true, using: :btree

  add_foreign_key "consultas", "canales", column: "id_canal_preg"
  add_foreign_key "consultas", "canales", column: "id_canal_resp"
  add_foreign_key "consultas", "personas"
end
