class MeasurementController < ApplicationController
  def list
    @per_frame = (3 * Measurement::FRAME_COLUMNS).to_f
    @total = Measurement.count.to_f
    @frames = (@total / @per_frame).ceil
  end

  def show
    @measurement = Measurement.find params[:id]
    @per_col = Measurement::MEASUREMENT_KEYS.length / 3
  end
end
