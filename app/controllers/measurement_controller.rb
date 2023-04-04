class MeasurementController < ApplicationController
  def list
    @measurements = Measurement.order measured_at: :desc
    @rows = (@measurements.length / 3.0).ceil
  end

  def show
    @measurement = Measurement.find params[:id]
    @per_col = Measurement::MEASUREMENT_KEYS.length / 3
  end
end
