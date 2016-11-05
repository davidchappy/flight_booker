class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :author

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    else
      return nil
    end
  end

  def current_user=(user)
    current_user = user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out(user)
    @current_user = nil
    session.clear
    cookies.delete(:remember_token)
  end

  def logged_in?
    session[:user_id] != nil
  end

end
