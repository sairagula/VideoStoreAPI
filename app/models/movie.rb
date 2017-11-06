class Movie < ApplicationRecord
  has_many :rentals

  validates :title, :inventory, presence: true
end
