class CommentsController < ApplicationController
  # ログインを要求するアクションの指定
  before_action :require_login, only: %i[create update destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
