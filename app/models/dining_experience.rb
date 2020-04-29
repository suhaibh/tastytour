class DiningExperience < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  enum price: {affordable: 0, moderate: 1, expensive: 2}

  validates_presence_of :date, :rating, :review

  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 5}
end
