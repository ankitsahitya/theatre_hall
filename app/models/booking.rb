class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :theater
	belongs_to :show
	has_many :tickets, dependent: :destroy
	validates :user_id, :theater_id, :show_id, :no_of_seats, :total_price, presence: true
  validates :no_of_seats, numericality: { only_integer: true }
  validates :total_price, numericality: true
end
