class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :rating, presence: true, numericality: { less_than_or_equal_to: 5, only_integer: true }
end
