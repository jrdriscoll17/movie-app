class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit update destroy]

  def new
    @review = Review.new
    @review.movie = Movie.find_by(params[:movie_id])
    # byebug
    # @movie = Movie.find_by_id(params[:movie_id])
  end

  def create
    # Remember to add flash message display in users/new view
    @review = Review.new(review_params)
    @review.movie_id = params[:movie_id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @review.update(review_params)
    redirect_to user_path(@review.user)
  end

  def destroy
    @review.delete
    redirect_to movies_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end

  def find_review
    @review = Review.find_by_id(params[:id])
  end
end
