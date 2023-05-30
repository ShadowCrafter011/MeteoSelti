class Api::RetrieveController < ApplicationController
    include ApiUtils
  
    protect_from_forgery with: :null_session
    before_action :validate_bearer_token!
    skip_before_action :determine_favicon
    
    def images
        per_frame = Measurement::API_RETRIEVE_COUNT
        @measurements = Measurement.order(measured_at: :desc).limit(per_frame).offset(params[:frame].to_i * per_frame)
    end
end
