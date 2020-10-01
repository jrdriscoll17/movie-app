# frozen_string_literal: true

class MoviesController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[index show]
  before_action :find_movie, only: %i[show edit update destroy]

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

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def movie_params
    params.require(:movie).permit(:title, reviews_attributes: %i[rating content user_id])
  end

  def find_movie
    @movie = Movie.find_by_id(params[:id])
  end
end
