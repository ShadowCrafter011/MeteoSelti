class ApplicationController < ActionController::Base
    before_action :require_https!, :check_locale, :determine_favicon
    around_action :switch_locale

    def require_https!
        redirect_to :protocol => "https://" unless (request.ssl? || request.local? || Rails.env == "development" || Rails.env == "test")
    end

    def check_locale
        return if session[:locale].present? && session[:time_zone].present?
        redirect_to locale_path p: request.path
    end

    def determine_favicon
        @favicon = Measurement.last.icon
    end

    def switch_locale(&action)
        locale = (cookies[:locale] || session[:locale] || I18n.default_locale).to_sym
        locale = I18n.default_locale unless I18n.available_locales.include? locale
        I18n.with_locale(locale, &action)
    end

    def title title
        @title = title
    end

    def tp(attribute, replace=nil, html_safe=false)
        translated = t("#{@locale[:path]}#{@locale[:action_override] ? "" : ".#{action_name}"}.#{attribute}")
        if replace == nil
            return html_safe ? translated.html_safe : translated
        end

        replaced = translated.sub("%s", replace.to_s)
        html_safe ? replaced.html_safe : replaced
    end
    helper_method :tp

    def tg pre="", attribute
        t "general.#{pre}#{pre.present? ? "." : ""}#{attribute}"
    end
    helper_method :tg

    def setup_locale base_path
        @locale = {
            path: "#{base_path}.",
            action_override: false
        }
    end

    def override_action action
        @locale[:path] += action.to_s
        @locale[:action_override] = true
    end
end
