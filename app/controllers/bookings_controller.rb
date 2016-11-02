class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight])
    @origin = @flight.origin.code
    @destination = @flight.destination.code
    @date = @flight.departure
    @number = @flight.id
    @booking = @flight.bookings.new
    passenger_count = params[:passengers].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(flight_id: params[:booking][:flight_id])
    params_passengers = params[:booking][:passengers_attributes]
    params_passengers.each do |passenger_index|
      @booking.passengers.create( name: params_passengers[passenger_index][:name],
                                  email: params_passengers[passenger_index][:email])
    end
    
    if @booking.save 
      flash[:success] = "Your flight is booked."
      redirect_to booking_path(@booking)
    else
      byebug
      flash.now[:danger] = "Something went wrong. Please try again."
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @origin = @booking.flight.origin.code
    @destination = @booking.flight.destination.code
    @date = @booking.flight.departure
    @number = @booking.flight.id
    @passengers = @booking.passengers
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email, :booking_id])
    end

end
