class PostsController < ApplicationController
  # ログインを要求するアクションの指定
  before_action :require_login, only: %i[new create edit update destroy search]

  # 参照系のアクション
  def index
    # 作成時刻の降順で表示
    @posts = if current_user
              current_user.feed.includes(:user).order(created_at: :desc).page(params[:page])
            else
              Post.all.includes(:user).order(created_at: :desc).page(params[:page])
            end
    # ランダムに5件のユーザーを取得
    @random_users = User.randoms(5)

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  # ログイン時のアクション
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      # 成功したとき
      redirect_to posts_path, success: '投稿に成功しました'
    else
      # 失敗したとき
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      # 成功したとき
      redirect_to posts_path, info: '投稿を編集しました'
    else
      # 失敗したとき
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, info: '投稿を削除しました'
  end

  def search
    @posts = Post.content_contain(params[:content])
  end

  private

  def post_params
    params.require(:post).permit(:content, images: [])
  end
end
