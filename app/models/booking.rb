class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :athlete
  has_many :reviews
end
