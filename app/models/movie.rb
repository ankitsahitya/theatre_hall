class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :audis, through: :shows
  validates :name, :category, presence: true
  validates :category, inclusion: { in: %w(U U/A A)}
end
