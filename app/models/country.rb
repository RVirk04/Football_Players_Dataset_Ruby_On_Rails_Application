class Country < ApplicationRecord
  has_many :players

  validates :name, presence: true
end
