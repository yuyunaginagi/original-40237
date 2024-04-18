class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if @comment.save
      CommentChannel.broadcast_to @review, { comment: @comment, user: @comment.user }
      redirect_to @review
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
