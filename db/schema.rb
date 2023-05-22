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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_191152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "measurements", force: :cascade do |t|
    t.datetime "measured_at"
    t.float "air_temperature"
    t.float "dewpoint_temperature"
    t.float "wet_bulb_temperature"
    t.float "wind_chill_temperature"
    t.float "relative_humidity"
    t.float "absolute_humidity"
    t.float "humidity_mixing_ratio"
    t.float "relative_air_pressure"
    t.float "absolute_air_pressure"
    t.float "air_density"
    t.float "specific_enthalpy"
    t.float "wind_speed"
    t.float "wind_direction"
    t.float "wind_direction_corrected"
    t.float "wind_direction_standard_deviation"
    t.float "wind_value_quality"
    t.float "compass_heading"
    t.float "precipitation"
    t.float "precipitation_intensity"
    t.integer "precipitation_type"
    t.float "rain_drop_volume"
    t.float "wind_sensor_heating"
    t.float "precipitation_sensor_heating"
    t.float "supply_voltage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "max_wind_speed"
    t.float "max_wind_direction"
    t.string "cloud_status"
    t.float "cloud_status_certainty"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
