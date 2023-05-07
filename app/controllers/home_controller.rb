class HomeController < ApplicationController
  before_action -> { setup_locale "home" }
  
  def index
    @last_measurement = Measurement.last
  end

  def time_zone
    return_to = url_from(params[:p]) || root_path
    session["time_zone"] = params[:t]
    cookies["locale"] = params[:l].split("-")[0] unless cookies["locale"].present?
    redirect_to return_to
  end
end
