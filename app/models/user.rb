class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, :age, :phone_no, presence: true
  validates :phone_no, length: { is: 10 }
  validates :age, numericality: { only_integer: true }
  validate :age_is_valid

  private

  def age_is_valid
    if self.age <= 0
      errors.add(:age, "should be greater then 0")
    end
  end
end
