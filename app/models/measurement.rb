require "date"

class Measurement < ApplicationRecord
    has_one_attached :sky_capture

    # 26 total measurements
    GRAPH_MEASUREMENT_KEYS = [
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
        :max_wind_speed,
        :wind_direction,
        :max_wind_direction,
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
        :supply_voltage,
        :load,
        :grid,
        :pv
    ]

    # 28 total measurements
    MEASUREMENT_KEYS = GRAPH_MEASUREMENT_KEYS.clone.append(
        :cloud_status,
        :cloud_status_certainty
    )

    FRAME_COLUMNS = 15
    API_RETRIEVE_COUNT = 1000

    def set_measured_at unix_timestamp
        self.measured_at = Time.at(unix_timestamp.to_f).to_datetime
    end

    def round measurement, default=0
        if (data = self[measurement]).is_a? Float
            data.round(1)
        elsif data.is_a?(Integer) || data.is_a?(String)
            data
        else
            default
        end 
    end

    def icon
        raining = self.round(:precipitation) > 0

        case self.cloud_status
        when "cloudy"
            raining ? "rain" : "clouds"
        when "sunny"
            raining ? "rain_sun" : "sun"
        when "between"
            raining ? "rain_sun" : "cloudy_sun"
        else
            "cloudy_sun"
        end
    end
    
    def get_errors
        errors = []
        self.errors.objects.each do |error|
            errors.append error.full_message
        end
        return errors
    end

    def self.created_at_most time
        Measurement.where("measured_at >= ?", time)
    end

    def self.created_today
        Measurement.where("measured_at >= ?", Time.now.beginning_of_day)
    end

    def self.data_for measurements=Measurement.all, measurement
        data = {}
        measurements.each do |m|
            if m[measurement].present?
                data[m.measured_at] = m[measurement].round(3)
            end
        end
        return data
    end

    def self.added_value measurements=Measurement.all, measurement
        output = 0
        measurements.each do |m|
            output += m[measurement] if m[measurement].present?
        end
        return output
    end

    def self.measurement_name symbol
        I18n.t "general.measurements.#{symbol.to_s}"
    end
end
