require_relative "country"

class World

  def self.population
    Country.pluck(:population).sum
  end

end
