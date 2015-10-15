class SetLanguageController < ApplicationController
  def english
    I18n.locale = :en
    set_session_and_redirect
  end

  def arabic
    I18n.locale = :ar
    set_session_and_redirect
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_to :root, turbolinks: false
    rescue ActionController::RedirectBackError
      redirect_to :root, turbolinks: false
  end
end