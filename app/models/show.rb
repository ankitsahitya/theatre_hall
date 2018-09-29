class Show < ApplicationRecord
	belongs_to :movie
	belongs_to :audi
	has_many :bookings, dependent: :destroy
	validates :time, :date, :available_seats, :movie_id, :audi_id, presence: true
  validates :available_seats, numericality: { only_integer: true }
end
