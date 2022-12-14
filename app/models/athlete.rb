class Athlete < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :first_name, presence: true, uniqueness: { scope: :last_name }
  validates :last_name, presence: true
  validates :price_per_day, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, only_integer: true }
  validates :location, presence: true
  validates :summary, presence: true
  validates :features, presence: true
  validates :sport, presence: true
  # validates :availability, presence: true
  validates :gender, presence: true, inclusion: { in: %w[male female], message: '%<value> is not a valid gender, has to be male or female' }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_athlete,
  against: [ :first_name, :last_name, :sport, :location ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
