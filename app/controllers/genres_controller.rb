class GenresController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[index show]
  
  def index
    @genres = Genre.all
  end
  
  def new
    @genre = Genre.new
  end

  def create
    # Remember to add flash message display in users/new view
    if (genre = Genre.create(genre_params))
      redirect_to genre_path(genre)
    else
      render 'new'
    end
  end

  def edit
    # Find what params looks like to figure out how to locate the genre
  end

  def update
    # Find what params looks like to figure out how to locate the genre
  end

  def destroy
    # Find what params looks like to figure out how to locate the genre
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
