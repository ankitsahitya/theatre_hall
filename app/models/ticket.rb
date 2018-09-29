class Ticket < ApplicationRecord
	belongs_to :booking
  belongs_to :audi
	belongs_to :movie
	validates :seat_no, :booking_id, :audi_id, :movie_id, :price, presence: true
	validates :seat_no, numericality: { only_integer: true }
	validates :price, numericality: true
end
