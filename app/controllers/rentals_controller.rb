class RentalsController < ApplicationController

  def create
    rental = Rental.new(rental_data)
    rental.due_date = Date.today + 3
    if rental.save
      render(
        json: {id: rental.id, customer_id: rental.customer.id, movie_id: rental.movie.id, due_date: rental.due_date}
      )
    else
      render(
        json: {error: rental.errors.messages}, status: :bad_request
      )
    end # if/else
  end # create

  def update
    rental = Rental.find_by(id: params[:id])
    if rental
      rental.checked_out = false
      if rental.save
        render(
          json: {"checked_in" => true}, status: :ok
        )
      else
        render(
          json: {error: rental.errors.messages}, status: :bad_request
        )
      end # if/else
    else
      render(
        json: {"no rental found": true}, status: :not_found
      )
    end # if rental
  end # update

  private
  def rental_data
    params.require(:rental).permit(:customer_id, :movie_id)
  end # rental_data
end
