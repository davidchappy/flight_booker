class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end
end
