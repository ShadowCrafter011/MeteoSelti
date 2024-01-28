module ApiUtils
    def validate_bearer_token!
        token = Rails.application.credentials[:bearer_token]
        render json: {success: false, message: "Invalid bearer token"}, status: :unauthorized unless request.headers["Authorization"] == token
    end
end