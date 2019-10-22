class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1 # 仮実装
    # binding.pry
    if @post.save
      # 成功したとき
      flash[:success] = '登録に成功しました'
      render :index
    else
      # 失敗したとき
      render :new
    end
  end

  def index
    @posts = Post.joins(
      'INNER JOIN users ON posts.user_id = users.id'
    ).select('posts.*, users.name')
  end

  def edit; end

  private
    def post_params
      params.require(:post).permit(:content,{images:[]})
    end
end
