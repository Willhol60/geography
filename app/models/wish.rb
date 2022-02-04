class Wish < ApplicationRecord
  belongs_to :country

  validates :budget, numericality: { only_integer: true }
end
