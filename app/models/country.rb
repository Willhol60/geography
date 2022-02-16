class Country < ApplicationRecord
  has_many :wishes, dependent: :destroy
  has_many :visits, dependent: :destroy
  # belongs_to :continent

  validates :name, :flag, :population, :capital, presence: true
  validates :population, numericality: true

  def self.world_pop
    pluck(:population).sum
  end

  def self.continent_hash
    hash = {}
    pluck(:id, :continent).each do |country|
      hash[country[0]] = country[1]
    end
    File.write('./country_migration.json', JSON.dump(hash))
  end
end
