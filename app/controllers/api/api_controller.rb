class Api::ApiController < ApplicationController
  include ApiUtils
  
  protect_from_forgery with: :null_session
  before_action :validate_bearer_token!
  skip_before_action :determine_favicon, :check_locale
  
  def ping
    render json: {success: true}
  end
end
