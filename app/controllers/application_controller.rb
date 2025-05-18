class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # males current_user method available in views (By default, all methods defined in Application Controller are already available in the controllers)
  helper_method :current_user

  # Checks if user is logged in or not. Whichever it is @current_user is assigned ||=
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # uses the current_user method to redirect logged out users to the login page.
  def require_user
    redirect_to "/signin" unless current_user
  end
end
