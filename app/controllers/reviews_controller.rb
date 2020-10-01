class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit update]

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  def edit; end

  def update
    @review.update(review_params)
    redirect_to user_path(@review.user)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_review
    @review = Review.find_by_id(params[:id])
  end
end
