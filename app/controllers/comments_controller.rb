class CommentsController < ApplicationController
  # ログインを要求するアクションの指定
  before_action :require_login, only: %i[create update destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    UserMailer.with(
      user_from: current_user,
      user_to: @comment.post.user,
      post: @comment.post
    ).comment_post.deliver_now
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_update_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end

  def comment_update_params
    params.require(:comment).permit(:content)
  end
end
