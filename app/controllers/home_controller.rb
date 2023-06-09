class HomeController < ApplicationController
  before_action -> { setup_locale "home" }
  layout false, only: :data_frame
  
  def index; end

  def data_frame
    @precipitation_float= Measurement::added_value Measurement::created_today, :precipitation
    @precipitation = @precipitation_float.to_i
    @precipitation_icon = @favicon

    last = Measurement.last

    @temperature = last.round(:air_temperature)
    @temperature_icon = @temperature > 0 ? "icons/thermometer_hot.png" : "icons/thermometer_cold.png"
    @temperature_class = case
    when @temperature > 30
      "hot"
    when @temperature < 0
      "cold"
    else
      "normal"
    end
    
    @humidity = last.round(:relative_humidity)
    
    @wind_direction = last.wind_direction_corrected
    @wind_speed = last.round(:wind_speed)

    @pressure = last.round(:absolute_air_pressure)

    @measurements = Measurement.order(measured_at: :desc).limit(8)
  end
end
