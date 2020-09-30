# frozen_string_literal: true

class MoviesController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[index show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
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
    # Find what params looks like to figure out how to locate the movie
  end

  def edit
    # Find what params looks like to figure out how to locate the movie
  end

  def update
    # Find what params looks like to figure out how to locate the movie
  end

  def destroy
    # Find what params looks like to figure out how to locate the movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
