class CommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: "コメントの作成に失敗しました")
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
