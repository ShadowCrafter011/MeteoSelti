class LanguageController < ApplicationController
  skip_before_action :check_locale
  skip_before_action :determine_favicon, only: :change

  def change
    return_to = url_from(params[:p]) || root_path
    redirect_to return_to unless I18n.available_locales.include? params[:locale]

    cookies[:locale] = { value: params[:locale].to_sym, expires: 20.years.from_now }
  end

  def locale
    @no_navbar = true

    if params[:t].present? && params[:l].present?
      session[:time_zone] = params[:t]
      session[:locale] = params[:l].split("-")[0]

      return_to = url_from(params[:p]) || root_path
      redirect_to return_to
    end
  end
end
