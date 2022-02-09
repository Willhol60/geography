class Country < ApplicationRecord
  has_many :wishes, dependent: :destroy
  has_many :visits, dependent: :destroy

  validates :name, :flag, :population, :capital, presence: true
  validates :population, numericality: true
  validates :continent, inclusion: { in: ['North America', 'South America', 'Europe', 'Africa',
                                          'Asia', 'Oceania', 'Antarctica'] }

end
