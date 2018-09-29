class Ticket < ApplicationRecord
	belongs_to :booking
  belongs_to :audi
	belongs_to :movie
	validates :seat_no, :booking_id, :audi_id, :movie_id, :price, presence: true
	validates :seat_no, numericality: { only_integer: true }
	validates :price, numericality: true
  validate :seat_no_is_valid
  validate :price_is_valid

  private

  def seat_no_is_valid
    if self.seat_no <= 0
      errors.add(:seat_no, "should be greater then 0")
    end
  end

  def price_is_valid
    if self.price <= 0
      errors.add(:price, "should be greater then 0")
    end
  end
end
