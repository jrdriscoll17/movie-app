class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    @review.update(review_params)
    redirect_to user_path(@review.user)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
