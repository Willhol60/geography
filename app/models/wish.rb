class Wish < ApplicationRecord
  belongs_to :country
  belongs_to :user

  validates :budget, numericality: { only_integer: true }
end
