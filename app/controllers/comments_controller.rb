class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: "コメントの作成に失敗しました")
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
