class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :capacity, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :price_per_night, presence: true
  validates :price_per_night, numericality: { only_integer: true, greater_than: 0 }
  has_one_attached :image


end
