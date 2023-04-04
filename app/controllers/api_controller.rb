class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :validate_bearer_token
  
  def create
    measurement = Measurement.new measurement_params.except(:measured_at)
    measurement.set_measured_at measurement_params[:measured_at]
    if measurement.save
      render json: {success: true, message: "Measurement created", id: measurement.id, measured_at: measurement.measured_at}, status: :created
    else
      render json: {success: false, meassage: "Measurement could not be created", errors: measurement.get_errors}, status: :unprocessable_entity
    end
  end

  def attach_image
    measurement = Measurement.find params[:id]
    if measurement.sky_capture.attach params[:sky_capture]
      render json: {success: true, message: "Sky capture attached to measurement #{params[:id]}"}, status: :accepted
    else
      render json: {success: false, message: "Could not attach sky capture to measurement #{params[:id]}", errors: measurement.get_errors}, code: :bad_request
    end
  end

  private
  def measurement_params
    params.require(:measurement).permit(:measured_at, Measurement::MEASUREMENT_KEYS)
  end

  def validate_bearer_token
    render json: {success: false, message: "Invalid bearer token"}, status: :unauthorized unless request.headers["Authorization"] == ENV["BEARER_TOKEN"]
  end
end
