class HomeController < ApplicationController
  before_action -> { setup_locale "home" }
  
  def index
    @precipitation = Measurement::added_value(Measurement::created_today, :precipitation).to_i
    @precipitation_icon = @precipitation > 0 ? "icons/rain.png" : "icons/cloudy_sun.png"

    last = Measurement.last

    @temperature = last.air_temperature.round(1)
    @temperature_icon = @temperature > 0 ? "icons/thermometer_hot.png" : "icons/thermometer_cold.png"
    @temperature_class = case
    when @temperature > 30
      "hot"
    when @temperature < 0
      "cold"
    else
      "normal"
    end
    
    @humidity = last.relative_humidity.round(1)
    
    @wind_direction = last.wind_direction_corrected
    @wind_speed = last.wind_speed.round(1)

    @pressure = last.absolute_air_pressure.round(1)

    @measurements = Measurement.order(measured_at: :desc).limit(8)
  end

  def time_zone
    return_to = url_from(params[:p]) || root_path
    session["time_zone"] = params[:t]
    cookies["locale"] = params[:l].split("-")[0] unless cookies["locale"].present?
    redirect_to return_to
  end
end
