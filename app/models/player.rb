class Player < ApplicationRecord
  belongs_to :country

  validates :name, :position, :overall, presence: true
  validates :name, uniqueness: true
  validates :overall, numericality: {only_integer: true}
end