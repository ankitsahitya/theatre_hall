class Audi < ApplicationRecord
	belongs_to :theater
	has_many :tickets, dependent: :destroy
	has_many :shows, dependent: :destroy
	has_many :movies, through: :shows
	validates :number, :theater_id, :no_of_seats, :price_of_seats, presence: true
	validates :number, :no_of_seats, :price_of_seats, numericality: { only_integer: true }
end
