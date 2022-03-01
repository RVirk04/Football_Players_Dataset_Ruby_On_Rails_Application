class Country < ApplicationRecord
  has_many :players

  validates :name, presence: true
  validates :name, uniqueness: true
end
