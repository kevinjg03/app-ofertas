# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_05_023317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_administradors_on_usuario_id"
  end

  create_table "categoria", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comercios", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.float "latitud"
    t.float "longitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estado_registros", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lista_compras", force: :cascade do |t|
    t.string "nombre"
    t.datetime "fecha_creacion"
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_lista_compras_on_usuario_id"
  end

  create_table "lista_detalles", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "prioridad"
    t.integer "lista_compra_id", null: false
    t.integer "producto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lista_compra_id"], name: "index_lista_detalles_on_lista_compra_id"
    t.index ["producto_id"], name: "index_lista_detalles_on_producto_id"
  end

  create_table "moderadors", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_moderadors_on_usuario_id"
  end

  create_table "notificacions", force: :cascade do |t|
    t.integer "tipo_notificacion_id", null: false
    t.text "mensaje"
    t.datetime "fecha_envio"
    t.boolean "estado_leido"
    t.string "medio"
    t.integer "usuario_id", null: false
    t.integer "producto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_notificacions_on_producto_id"
    t.index ["tipo_notificacion_id"], name: "index_notificacions_on_tipo_notificacion_id"
    t.index ["usuario_id"], name: "index_notificacions_on_usuario_id"
  end

  create_table "preferencia", force: :cascade do |t|
    t.string "unidad_monetaria"
    t.boolean "recibir_notificaciones"
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_preferencia_on_usuario_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "marca"
    t.string "presentacion"
    t.text "descripcion"
    t.integer "categoria_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
  end

  create_table "registro_precios", force: :cascade do |t|
    t.decimal "precio"
    t.string "moneda"
    t.datetime "fecha_registro"
    t.string "foto_ticket_url"
    t.float "latitud"
    t.float "longitud"
    t.boolean "es_atipico"
    t.integer "estado_registro_id", null: false
    t.integer "producto_id", null: false
    t.integer "comercio_id", null: false
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comercio_id"], name: "index_registro_precios_on_comercio_id"
    t.index ["estado_registro_id"], name: "index_registro_precios_on_estado_registro_id"
    t.index ["producto_id"], name: "index_registro_precios_on_producto_id"
    t.index ["usuario_id"], name: "index_registro_precios_on_usuario_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_notificaciones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "ombre_usuario"
    t.string "correo"
    t.string "clave_hash"
    t.string "unidad_monetaria"
    t.boolean "preferencias_notificaciones"
    t.datetime "fecha_registro"
    t.integer "rol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["rol_id"], name: "index_usuarios_on_rol_id"
  end

  add_foreign_key "administradors", "usuarios"
  add_foreign_key "lista_compras", "usuarios"
  add_foreign_key "lista_detalles", "lista_compras"
  add_foreign_key "lista_detalles", "productos"
  add_foreign_key "moderadors", "usuarios"
  add_foreign_key "notificacions", "productos"
end
