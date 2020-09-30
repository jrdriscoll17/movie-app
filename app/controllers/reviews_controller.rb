class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
