class Country < ApplicationRecord
  has_many :visits, dependent: :destroy
  has_many :wishes, dependent: :destroy
  belongs_to :world

  validates :name, :flag, :population, :capital, presence: true
  validates :population, numericality: true
end
