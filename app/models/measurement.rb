require "date"

class Measurement < ApplicationRecord
    has_one_attached :sky_capture

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
end
