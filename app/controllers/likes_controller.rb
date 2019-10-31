class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    redirect_to root_path
  end

  def destroy
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
    redirect_to root_path
  end
end
