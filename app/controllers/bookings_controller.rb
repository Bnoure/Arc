
class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @dates = @bookings.map { |booking| (booking.starts_at - Date.today).to_i }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.js { flash.now[:success] = 'Booking was successfully created.' }
        format.turbo_stream
      else
        format.js { flash.now[:error] = 'There was an error creating the booking.' }
        format.turbo_stream
      end
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_back(fallback_location: request.referer)
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :room_id, :user_id)
  end
end
