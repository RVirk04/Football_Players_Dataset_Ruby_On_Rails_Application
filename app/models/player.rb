class Player < ApplicationRecord
  belongs_to :country

  validates :name, :position, :overall, presence: true
  validates :name, uniqueness: true
  validates :overall, numericality: {only_integer: true}

  def self.search(keyword, search_category)
    if keyword.present?
      if keyword && search_category == "All"
        where('name LIKE ?', "%#{keyword}%")
      elsif keyword == " " && search_category != "All"
        joins(:countries).where('countries.id = ?', "%#{search_category}%")
      else
        where('name LIKE ? OR country_id = ?', "%#{keyword}%", "%#{search_category}%")
      end
    else
      all
    end
  end
end
