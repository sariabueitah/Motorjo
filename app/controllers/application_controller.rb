class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :authenticate_admin?
  before_action :set_locale, :setmeta
  def setmeta
    set_meta_tags description: 'أول موقع أردني متخصص في بيع وشراء السيارات والدراجات والاليات بالأردن الجديدة والمستعملة و هو موقعك المناسب للاعلانات المبوبة في الاردن'
    @customKeywords = 'سيارات بالأردن, سيارات للبيع بالأردن ,سيارات مستعملة بالأردن ,سيارات جديدة بالأردن ,وكلاء سيارات بالأردن ,معاراض سيارات بالأردن ,Car In Jordan,Car For Sale In Jordan ,Car Showrooms In Jordan'
  end
  def set_locale
    I18n.locale =  session[:locale] || http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
    session[:locale] = I18n.locale
    if current_user
      current_user.language = current_user.language || session[:locale]
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
