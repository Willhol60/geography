class Country < ApplicationRecord
  has_many :wishes
  has_many :visits
end
