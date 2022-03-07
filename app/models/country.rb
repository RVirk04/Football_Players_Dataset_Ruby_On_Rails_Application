class Country < ApplicationRecord
  has_many :players

  validates :name, presence: true
  validates :name, uniqueness: true

  geocoded_by :name;
  after_validation :geocode
end
