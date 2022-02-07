class Country < ApplicationRecord
  has_many :wishes, dependent: :destroy
  has_many :visits, dependent: :destroy
end
