class CommentChannel < ApplicationCable::Channel
  def subscribed
    @review = Review.find(params[:review_id])
    stream_for @review
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
