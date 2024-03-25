class HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end
  def show
    @hotel = Hotel.find(params[:id])
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_path
  end
  
end
