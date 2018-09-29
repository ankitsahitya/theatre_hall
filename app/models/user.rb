class User < ApplicationRecord
	has_many :bookings, dependent: :destroy
	validates :name, :age, :phone_no, presence: true
	validates :phone_no, length: { is: 10 }
	validates :age, numericality: { only_integer: true }
end
