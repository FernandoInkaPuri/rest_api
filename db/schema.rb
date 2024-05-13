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

ActiveRecord::Schema[7.1].define(version: 2024_05_12_180310) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: :cascade do |t|
    t.string "payment_id"
    t.string "payment_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policies", force: :cascade do |t|
    t.datetime "data_emissao"
    t.datetime "data_fim_cobertura"
    t.bigint "segurado_id", null: false
    t.bigint "veiculo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "charge_id"
    t.index ["charge_id"], name: "index_policies_on_charge_id"
    t.index ["segurado_id"], name: "index_policies_on_segurado_id"
    t.index ["veiculo_id"], name: "index_policies_on_veiculo_id"
  end

  create_table "segurados", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "marca"
    t.string "modelo"
    t.integer "ano"
    t.string "placa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "policies", "charges"
  add_foreign_key "policies", "segurados"
  add_foreign_key "policies", "veiculos"
end
