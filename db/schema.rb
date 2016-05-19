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

ActiveRecord::Schema.define(version: 20160519183741) do

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

  create_table "direcciones", force: :cascade do |t|
    t.integer  "eje_calle_id"
    t.integer  "calle_id"
    t.integer  "entre1_id"
    t.integer  "entre2_id"
    t.integer  "localidad_id"
    t.float    "altura"
    t.string   "descripcion"
    t.string   "calle"
    t.string   "entre1"
    t.string   "entre2"
    t.boolean  "fidelizacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "direcciones", ["calle", "altura"], name: "index_xp_direcciones_on_calle_and_altura", using: :btree
  add_index "direcciones", ["calle"], name: "index_xp_direcciones_on_calle", using: :btree

  create_table "direcciones_com", force: :cascade do |t|
    t.string   "monoblock"
    t.string   "escalera"
    t.string   "piso"
    t.string   "depto"
    t.string   "casa"
    t.string   "manzana"
    t.string   "observacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "imponibles", force: :cascade do |t|
    t.integer  "imponible_id"
    t.string   "imponible_type"
    t.datetime "fh_alta"
    t.string   "login_alta"
    t.string   "situacion"
    t.integer  "titular_id"
    t.integer  "responsable_pago_id"
    t.integer  "direccion_id"
    t.integer  "direccion_com_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "imponibles", ["imponible_id", "imponible_type"], name: "index_xp_imponibles_on_imponible_id_and_imponible_type", unique: true, using: :btree

  create_table "persona_mailes", force: :cascade do |t|
    t.integer  "persona_id"
    t.datetime "fh_alta"
    t.string   "login_alta"
    t.boolean  "valido"
    t.boolean  "principal"
    t.string   "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "personas_telefono", force: :cascade do |t|
    t.integer  "persona_id"
    t.integer  "area_id"
    t.string   "numero"
    t.datetime "fh_alta"
    t.string   "login_alta"
    t.boolean  "valido"
    t.boolean  "principal"
    t.string   "red_tipo"
    t.string   "telefono_tipo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "login",                  limit: 30,                 null: false
    t.string   "password_digest"
    t.string   "nombre",                 limit: 50
    t.string   "email",                  limit: 50
    t.string   "telefono",               limit: 25
    t.integer  "canal_id"
    t.boolean  "admin",                             default: false
    t.datetime "fh_baja"
    t.boolean  "habilitado",                        default: true
    t.datetime "last_action"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "usuarios", ["auth_token"], name: "index_xp_usuarios_on_auth_token", using: :btree
  add_index "usuarios", ["email"], name: "index_xp_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["login"], name: "index_xp_usuarios_on_login", unique: true, using: :btree

  add_foreign_key "consultas", "canales", column: "id_canal_preg"
  add_foreign_key "consultas", "canales", column: "id_canal_resp"
  add_foreign_key "consultas", "personas"
  add_foreign_key "imponibles", "direcciones"
  add_foreign_key "imponibles", "direcciones_com"
  add_foreign_key "imponibles", "personas", column: "responsable_pago_id"
  add_foreign_key "imponibles", "personas", column: "titular_id"
  add_foreign_key "imponibles", "usuarios", column: "login_alta", primary_key: "login"
  add_foreign_key "usuarios", "canales"
end
