class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :athlete
  has_many :reviews

  # validates :user_id, uniqueness: { scope: :athlete_id }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :status, presence: true
  validates :price, presence: true
  validates :duration, presence: true
end
