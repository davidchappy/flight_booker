class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map{ |a| [a.code, a.id] }
    @passengers = (1..10)
    @dates = Flight.all.map {|d| [format_date(d.departure), d.departure]}.uniq
    
    @flights = Flight.where(  departure: params[:date],
                              origin_id: params[:from],
                              destination_id: params[:to]) unless params.nil?
    @count = params[:passengers]
  end
end
