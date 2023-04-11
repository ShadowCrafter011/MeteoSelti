class Api::ApiController < ApplicationController
  include ApiUtils
  
  protect_from_forgery with: :null_session
  before_action :validate_bearer_token!
  
  def ping
    render json: {success: true}
  end
end
