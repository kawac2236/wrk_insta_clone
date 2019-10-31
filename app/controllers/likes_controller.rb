class LikesController < ApplicationController
  def create
    @post = Post.find_by(params[:id])
    current_user.like(@post)
  end

  def destroy
    @post = Post.find_by(params[:id])
    current_user.unlike(@post)
  end
end
