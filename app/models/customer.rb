class Customer < ApplicationRecord
  # include ActiveModel::Serialization

  has_many :rentals

  validates :name, presence: true

  def movies_checked_out_count
    self.rentals.where(checked_out: true).count
  end # movies_checked_out

end
