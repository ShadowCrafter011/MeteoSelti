class LanguageController < ApplicationController
  skip_before_action :determine_favicon

  def change
    return_to = url_from(params[:p]) || root_path
    redirect_to return_to unless I18n.available_locales.include? params[:locale]

    cookies[:locale] = params[:locale].to_sym
  end
end
