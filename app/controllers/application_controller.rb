class ApplicationController < ActionController::Base
    before_action :require_https!

    def require_https!
        redirect_to :protocol => "https://" unless (request.ssl? || request.local? || Rails.env == "development" || Rails.env == "test")
    end
end
