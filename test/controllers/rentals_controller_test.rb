require "test_helper"

describe RentalsController do
  let(:c) {Customer.first}
  let(:m) {Movie.first}
  describe "checkout" do
    it "will create a new instance of rental" do
      # arrange
      rental_data =
      {
        customer_id: c.id,
        movie_id: m.id
      }

      start_count = Rental.count
      availible = m.available_inventory
      num_movies = c.movies_checked_out_count

      # Act
      post rentals_path, params: {rental: rental_data}

      # Assert
      Rental.count.must_equal start_count + 1
      m.available_inventory.must_equal availible - 1
      c.movies_checked_out_count.must_equal num_movies + 1
    end # create a new instance

    it "won't change the db if the request didn't provide the movie_id" do
      rental_data =
      {
        movie_id: m.id
      }

      start_count = Rental.count
      availible = m.available_inventory
      num_movies = c.movies_checked_out_count

      # Act
      post rentals_path, params: {rental: rental_data}

      # Assert
      Rental.count.must_equal start_count
      m.available_inventory.must_equal availible
      c.movies_checked_out_count.must_equal num_movies 
    end # without customer_id

    it "won't change the db if the request didn't provide the customer_id" do
    end # without movie_id
  end # checkout
end
