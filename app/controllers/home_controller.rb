class HomeController < ApplicationController
  before_action -> { setup_locale "home" }
  
  def index
    @last_measurement = Measurement.last
  end
end
