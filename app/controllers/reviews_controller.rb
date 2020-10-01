class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  def edit
    # raise params.inspect
    @review = Review.find_by_id(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
