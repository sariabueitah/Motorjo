class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :authenticate_admin?
  before_action :set_locale
  def set_locale
    I18n.locale =  session[:locale] || http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
    session[:locale] = I18n.locale
    if current_user
      current_user.language |= session[:locale]
      current_user.save
    end
  end
  def authenticate_admin!
    if user_signed_in?
      if(current_user.isadmin)
        true
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
  def authenticate_admin?
    if user_signed_in?
      if(current_user.isadmin)
        true
      else
        false
      end
    else
      false
    end
  end
end
