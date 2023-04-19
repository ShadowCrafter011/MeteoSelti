class Api::MeasurementController < ApplicationController
  include ActionView::Helpers::DateHelper
  include ApiUtils
  
  protect_from_forgery with: :null_session
  before_action :validate_bearer_token!

  def create
    measurement = Measurement.new measurement_params.except(:measured_at)
    measurement.set_measured_at measurement_params[:measured_at]
    if measurement.save
      render json: {success: true, message: "Measurement created", id: measurement.id, measured_at: measurement.measured_at}, status: :created
      
      ActionCable.server.broadcast("measurement", {
        action: "new",
        id: measurement.id,
        total: Measurement.count,
        per_frame: Measurement::FRAME_COLUMNS * 3
      })

    else
      render json: {success: false, meassage: "Measurement could not be created", errors: measurement.get_errors}, status: :unprocessable_entity
    end
  end

  def image
    measurement = Measurement.find params[:id]
    if measurement.sky_capture.attach params[:sky_capture]
      render json: {success: true, message: "Sky capture attached to measurement #{params[:id]}"}, status: :accepted
    else
      render json: {success: false, message: "Could not attach sky capture to measurement #{params[:id]}", errors: measurement.get_errors}, code: :bad_request
    end
  end

  def last
    render json: Measurement.last(params[:amount]).to_json(except: :id)
  end

  def all
    render json: Measurement.all.to_json(except: :id)
  end

  def last_measured_at
    render json: {
      success: true,
      meassage: "Last measurement found",
      timestamp: Measurement.last.measured_at.to_i
    } if Measurement.last.present?
  end

  def last
    render json: Measurement.last(params[:amount]).to_json(except: :id)
  end

  private
  def measurement_params
    params.require(:measurement).permit(:measured_at, :sky_capture, Measurement::MEASUREMENT_KEYS)
  end
end
