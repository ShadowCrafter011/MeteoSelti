class Frames::MeasurementController < ApplicationController
  layout false
  before_action -> { setup_locale "frames.measurement" }

  def list
    per_frame = 3 * Measurement::FRAME_COLUMNS
    @offset = params[:frame_id].to_i * per_frame
    @measurements = Measurement.order(measured_at: :desc).limit(per_frame).offset(@offset)
  end
end
