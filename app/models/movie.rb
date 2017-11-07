class Movie < ApplicationRecord
  has_many :rentals

  validates :title, :inventory, presence: true

  def available_inventory
    (self.inventory) - (self.rentals.where(checked_out: true).count)
  end

end
