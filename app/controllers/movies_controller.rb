# frozen_string_literal: true

class MoviesController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[index show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @movie.reviews.build
  end

  def create
    # Remember to add flash message display in users/new view
    if (movie = Movie.create(movie_params))
      redirect_to movie_path(movie)
    else
      render 'new'
    end
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  def edit
    @movie = Movie.find_by_id(params[:id])
  end

  def update
    @movie = Movie.find_by_id(params[:id])
  end

  def destroy
    @movie = Movie.find_by_id(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, reviews_attributes: %i[rating content user_id])
  end
end
