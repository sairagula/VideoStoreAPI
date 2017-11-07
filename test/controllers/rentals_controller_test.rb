require "test_helper"

describe RentalsController do
  describe "checkout" do
    it "will create a new instance of rental" do
      c = Customer.first
      m = Movie.first
      rental_data =
      {
        customer_id: c.id,
        movie_id: m.id
      }
      start_count = Rental.count

      post rentals_path, params: {rental: rental_data}

      Rental.count.must_equal start_count + 1
    end # create a new instance
  end # checkout
end
