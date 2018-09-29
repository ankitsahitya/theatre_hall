class Audi < ApplicationRecord
  belongs_to :theatre
  has_many :tickets, dependent: :destroy
  has_many :shows, dependent: :destroy
  has_many :movies, through: :shows
  validates :number, :theatre_id, :no_of_seats, :price_of_seat, presence: true
  validates :number, :no_of_seats, :price_of_seat, numericality: { only_integer: true }
  validate :no_of_seats_is_valid
  validate :price_of_seat_is_valid

  private

  def no_of_seats_is_valid
    if self.no_of_seats <= 0
      errors.add(:no_of_seats, "should be greater then 0")
    end
  end

  def price_of_seat_is_valid
    if self.price_of_seat <= 0
      errors.add(:price_of_seat, "should be greater then 0")
    end
  end
end
