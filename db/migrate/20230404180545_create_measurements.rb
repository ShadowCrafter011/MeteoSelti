class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.datetime :measured_at

      t.float   :air_temperature
      t.float   :dewpoint_temperature
      t.float   :wet_bulb_temperature
      t.float   :wind_chill_temperature
      t.float   :relative_humidity
      t.float   :absolute_humidity
      t.float   :humidity_mixing_ratio
      t.float   :relative_air_pressure
      t.float   :absolute_air_pressure
      t.float   :air_density
      t.float   :specific_enthalpy
      t.float   :wind_speed
      t.float   :wind_direction
      t.float   :wind_direction_corrected
      t.float   :wind_direction_standard_deviation
      t.float   :wind_value_quality
      t.float   :compass_heading
      t.float   :precipitation
      t.float   :precipitation_intensity
      t.integer :precipitation_type
      t.float   :rain_drop_volume
      t.float   :wind_sensor_heating
      t.float   :precipitation_sensor_heating
      t.float   :supply_voltage

      t.timestamps
    end
  end
end
