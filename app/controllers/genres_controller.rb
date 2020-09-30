# frozen_string_literal: true

class GenresController < ApplicationController
  skip_before_action :require_authenticated_user

  def index
    @genres = Genre.all
  end

  def show
    # Find what params looks like to figure out how to locate the genre
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
