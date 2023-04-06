require "date"

class Measurement < ApplicationRecord
    has_one_attached :sky_capture

    # 24 total measurements
    MEASUREMENT_KEYS = [
        :air_temperature, 
        :dewpoint_temperature, 
        :wet_bulb_temperature, 
        :wind_chill_temperature,
        :relative_humidity,
        :absolute_humidity,
        :humidity_mixing_ratio,
        :relative_air_pressure,
        :absolute_air_pressure,
        :air_density,
        :specific_enthalpy,
        :wind_speed,
        :wind_direction,
        :wind_direction_corrected,
        :wind_direction_standard_deviation,
        :wind_value_quality,
        :compass_heading,
        :precipitation,
        :precipitation_intensity,
        :precipitation_type,
        :rain_drop_volume,
        :wind_sensor_heating,
        :precipitation_sensor_heating,
        :supply_voltage
    ]

    def set_measured_at unix_timestamp
        self.measured_at = Time.at(unix_timestamp.to_f).to_datetime
    end
    
    def get_errors
        errors = []
        self.errors.objects.each do |error|
            errors.append error.full_message
        end
        return errors
    end

    def self.created_at_most time
        Measurement.where("measured_at > ?", time)
    end

    def self.data_for measurements=Measurement.all, measurement
        data = {}
        measurements.each do |m|
            data[m.measured_at] = m[measurement].round(3)
        end
        return data
    end

    def self.measurement_name symbol
        words = symbol.to_s.split "_"
        words[0] = words[0].capitalize
        words.join " "
    end
end
