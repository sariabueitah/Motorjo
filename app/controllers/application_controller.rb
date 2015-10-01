class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :authenticate_admin?
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
