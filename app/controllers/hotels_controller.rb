class HotelsController < ApplicationController
  def index
    if params[:search] && params[:search][:city].present?
      @search_params = search_params.to_h
      @search_params[:start_date], @search_params[:end_date] = @search_params[:start_date].split(' au ')
      @hotels = Hotel.joins(:rooms).where('city ILIKE ?', "%#{@search_params[:city]}%").where('rooms.capacity >= ?', @search_params[:capacity]).distinct
      hotel = Hotel.find_by('city ILIKE ?', "%#{@search_params[:city]}%")
      if hotel
        @city = hotel.city
      else
        respond_to do |format|
          format.html { redirect_to request.referrer || root_path, alert: "La ville n'est pas trouvée." }
          format.js { render js: "Swal.fire('Erreur', 'La ville n\'est pas trouvée.', 'error')" }
        end
        return
      end
      @search_params[:city] = @city
    else
      @hotels = Hotel.all
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_path
  end

  private
  def search_params
    params.require(:search).permit(:city, :capacity, :start_date, :end_date)
  end

end
