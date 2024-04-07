class LikesController < ApplicationController
  before_action :set_review

  def create
    like = current_user.likes.build(review_id: params[:review_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(review_id: params[:review_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  
  def set_review
    @review = Review.find(params[:review_id])
  end
end
