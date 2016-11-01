class FlightsController < ApplicationController
  def index
    @from = Airport.all.map(&:code)
    @to = Airport.all.map(&:code)
    @passengers = (1..10)
    @dates = Flight.all.map {|d| format_date(d.departure)}
  end

  def show
  end
end
