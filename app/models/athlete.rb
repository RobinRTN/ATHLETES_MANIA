class Athlete < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :first_name, presence: true, uniqueness: { scope: :last_name }
  validates :last_name, presence: true
  validates :price_per_day, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, only_integer: true }
  validates :location, presence: true
  validates :summary, presence: true
  validates :features, presence: true
  validates :sport, presence: true
end
