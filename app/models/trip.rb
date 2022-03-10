class Trip < ApplicationRecord
  belongs_to :country
  belongs_to :user

  validates :date, :notes, presence: true
  validates :notes, length: { maximum: 30 }
end
