class MoviesController < ApplicationController
<<<<<<< HEAD
=======
  # protect_from_forgery with: :null_session
>>>>>>> eea8e4e520bf2cd033d0cff710298a1183a7c38d

  def index
    movies = Movie.all
    render(
      json: movies.as_json(only: [:id, :title, :overview, :release_date, :inventory]),
      status: :ok
    )
  end

  def show
    movie = Movie.find_by(id: params[:id])

    if movie
      render(
        json: movie.as_json(only: [:id, :title, :overview, :release_date, :inventory]),
        status: :ok
      )
    else
      render(
        json: {nothing: true}, status: :not_found
      )
    end
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render(
        json: {id: movie.id}, status: :ok
      )
    else
      render(
        json: {errors: movie.errors.messages}, status: :bad_request
      )
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :release_date, :inventory)
  end
end
