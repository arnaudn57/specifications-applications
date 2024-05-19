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

ActiveRecord::Schema[7.0].define(version: 2024_05_19_174205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specifications", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "client_email"
    t.string "token"
    t.datetime "token_expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "enseigne"
    t.string "raison_sociale"
    t.string "forme_juridique"
    t.string "activite"
    t.string "rcs"
    t.string "code_ape"
    t.string "siret"
    t.string "siren"
    t.string "tva_intra"
    t.string "adresse_societe"
    t.string "ville_societe"
    t.string "cp_societe"
    t.string "tel_societe"
    t.string "mail_societe"
    t.string "nom_gerant"
    t.string "prenom_gerant"
    t.string "tel_gerant"
    t.string "gsm_gerant"
    t.string "mail_gerant"
    t.string "nom_responsable"
    t.string "prenom_responsable"
    t.string "tel_responsable"
    t.string "gsm_responsable"
    t.string "mail_responsable"
    t.datetime "prevu_ouverture"
    t.datetime "prevu_installation"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "users", "companies"
end
