class Country < ApplicationRecord
  has_many :players

  validates :name, presence: true
  validates :name, uniqueness: true

  # geocoded_by :address;
  # after_validation :geocode,

  # def address
  #   [name].compact.join(",")
  # end
  # # if: :address_changed?
  # # def address_changed
  # #   name_changed?
  # # end
end
