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
      redirect_to posts_path, success: '投稿しました'
    else
      # 失敗したとき
      render :new
    end
  end

  def index
    # 作成時刻の降順で表示
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, info: '投稿を削除しました'
  end
  private
    def post_params
      params.require(:post).permit(:content,{images:[]})
    end
end
