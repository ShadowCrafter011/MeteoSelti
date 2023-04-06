class HomeController < ApplicationController
  def index
    @last_measurement = Measurement.last
  end
end
