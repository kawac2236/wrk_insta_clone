class PostsController < ApplicationController
  def new; end

  def index
    @posts = posts = Post.joins(
      'INNER JOIN users ON posts.user_id = users.id'
    ).select('posts.*, users.name')
  end

  def edit; end
end
