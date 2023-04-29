class MeasurementController < ApplicationController
  before_action -> { setup_locale "measurement" }
  
  def list
    title tp("measurements")
    @per_frame = (3 * Measurement::FRAME_COLUMNS).to_f
    @total = Measurement.count.to_f
    @frames = (@total / @per_frame).ceil
  end

  def show
    @measurement = Measurement.find params[:id]
    @per_col = (Measurement::MEASUREMENT_KEYS.length / 3.0).ceil
    title "#{tp("measurement_from")} #{@measurement.measured_at.strftime("%d %B %Y - %H:%M")}"
  end
end
