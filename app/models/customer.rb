class Customer < ApplicationRecord
  has_many :rentals

  validates :name, presence: true

  def self.movies_checked_out
    self.rentals.where(checked_out: true).count
  end # movies_checked_out

end
