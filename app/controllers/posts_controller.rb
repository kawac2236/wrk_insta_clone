class PostsController < ApplicationController
  # ログインを要求するアクションの指定
  before_action :require_login, only: %i[new create edit update destroy]

  # 参照系のアクション
  def index
    # 作成時刻の降順で表示
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  # ログイン時のアクション
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # 成功したとき
      redirect_to posts_path, success: '投稿に成功しました'
    else
      # 失敗したとき
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      # 成功したとき
      redirect_to posts_path, info: '投稿を編集しました'
    else
      # 失敗したとき
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, info: '投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:content, images: [])
  end
end
