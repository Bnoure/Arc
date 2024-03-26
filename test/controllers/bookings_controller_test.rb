require 'test_helper'


class BookingsControllerTest < ActionDispatch::IntegrationTest
  fixtures :bookings, :rooms, :users
  setup do
    @booking = bookings(:one)
    @invalid_params = { starts_at: '3', ends_at: '20d', room_id: rooms(:one).id, user_id: users(:one).id }
    hotel = Hotel.new( name: 'HotelNour', city: 'Paris', address: 'Paris',)
    room = Room.new(name: 'RoomNour', capacity: 2, price_per_night: 100, hotel: hotel)
  end

  test "should not create booking and render show" do
    assert_no_difference('Booking.count') do
      post hotel_room_bookings_url(@booking.room.hotel, @booking.room), params: { booking: @invalid_params }
    end

    assert_response :success
    assert_select "p", "Ville: #{@booking.room.hotel.city}"
    assert_select "p", "Nombre de personnes: #{@booking.room.capacity}"
    assert_select "p", "Date de début: #{@booking.starts_at}"
    assert_select "p", "Date de fin: #{@booking.ends_at}"
    assert_select "p", "Nombre de jours: #{(@booking.ends_at - @booking.starts_at).to_i}"
    assert_select "p", "Prix total: #{(@booking.ends_at - @booking.starts_at).to_i * @booking.room.price_per_night}"
  end
end
