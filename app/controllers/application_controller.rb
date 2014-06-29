class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :auth_require


  def logged_in
    !current_user.nil?
  end

  def current_user
      @current_user ||= session[:user] if session[:user]
  end

  def auth_require
    if (!logged_in)
      flash[:danger] = "You need to be logged in before proceeding"
      redirect_to login_form_url
    end
  end

  helper_method :logged_in

end
