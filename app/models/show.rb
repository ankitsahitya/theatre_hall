class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :audi
  has_many :bookings, dependent: :destroy
  validates :time, :date, :available_seats, :movie_id, :audi_id, presence: true
  validates :available_seats, numericality: { only_integer: true }
  validate :available_seats_limit
  validate :time_is_valid
  validate :date_is_valid
  before_create :populate_available_seats

  private

  def time_is_valid
    if self.date == Date.today && self.time <= Time.now
      errors.add(:time, "should can not be of past")
    end
  end

  def date_is_valid
    if self.date < Date.today
      errors.add(:date, "should can not be of past")
    end
  end

  def available_seats_limit
    if self.available_seats > self.audi.no_of_seats
      errors.add(:available_seats, "can not be greater then the no of seats in the audi")
    elsif self.available_seats < 0
      errors.add(:available_seats, "can not be less then 0")
    end
  end

  def populate_available_seats
    self.available_seats = self.audi.no_of_seats
  end
end
