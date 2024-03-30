class ReviewsController < ApplicationController
  before_action :move_to_index

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:date, :activity, :review)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
