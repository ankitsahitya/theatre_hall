class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :theatre
  belongs_to :show
  has_many :tickets, dependent: :destroy
  validates :user_id, :theatre_id, :show_id, :no_of_seats, :total_price, presence: true
  validates :no_of_seats, numericality: { only_integer: true }
  validates :total_price, numericality: true
  validate :seats_booking_limit
  validate :no_of_seats_is_valid
  validate :show_not_started, on: [:create]
  validate :user_permitted_for_movie
  before_destroy :check_show_started
  before_destroy :increase_available_seats
  after_save :reduce_available_seats
  before_save :calculate_total_price
  after_save :generate_tickets

  private

  def no_of_seats_is_valid
    if self.no_of_seats <= 0
      errors.add(:no_of_seats, "should be greater then 0")
    end
  end 

  def seats_booking_limit
    if self.no_of_seats > self.show.available_seats
      errors.add(:no_of_seats, "can not be greater then available no of seats")
    end
  end

  def show_not_started
    if self.show.date < Date.today || (self.show.date == Date.today && self.show.time <= Time.now)
      errors.add(:base, "Booking can not be created after the show has started")
    end
  end

  def check_show_started
    if self.show.date < Date.today || (self.show.date == Date.today && self.show.time <= Time.now)
      raise "Booking can not be destroyed after the show has started"
    end
  end

  def user_permitted_for_movie
    if self.user.age < 18 && self.show.movie.category == "A"
      errors.add(:user, "not permitted for the movie")
    end
  end

  def reduce_available_seats
    left_seats = self.show.available_seats-self.no_of_seats+self.no_of_seats_was
    unless self.show.update_attributes(available_seats: left_seats)
      raise "Requested no of seats can not be booked"
    end
  end

  def increase_available_seats
    left_seats = self.show.available_seats+self.no_of_seats
    self.show.update_attributes(available_seats: left_seats)
  end

  def calculate_total_price
    self.total_price = self.no_of_seats*self.show.audi.price_of_seat
  end

  def generate_tickets
    seat_no = self.show.available_seats
    self.no_of_seats.times do
      Ticket.create!(booking: self, movie: self.show.movie, audi: self.show.audi, seat_no: seat_no, price: self.audi.price_of_seat)
      seat_no = seat_no - 1
    end
  end
end
