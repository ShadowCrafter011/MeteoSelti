class ApplicationController < ActionController::Base
    def validate_bearer_token
        render json: {success: false, message: "Invalid bearer token"}, status: :unauthorized unless request.headers["Authorization"] == ENV["BEARER_TOKEN"]
    end
end
