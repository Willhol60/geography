require_relative "country"

class World < ApplicationRecord
  has_many :countries
  has_many :wishes, through: :countries
  has_many :visits, through: :countries

  def self.population
    Country.pluck(:population).sum
  end
end
