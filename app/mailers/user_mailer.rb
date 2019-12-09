class UserMailer < ApplicationMailer
  default from: 'notifications-insta-clone@example.com'
  # いいねの通知
  def like_post
    @post = params[:post]
    @user_to = params[:user_to]
    @user_from = params[:user_from]
    mail(to: @user_to.email, subject: "#{@user_from.name}があなたの投稿にいいねしました")
  end

  # コメントの通知
  def comment_post
    @post = params[:post]
    @user_to = params[:user_to]
    @user_from = params[:user_from]
    mail(to: @user_to.email, subject: "#{@user_from.name}があなたの投稿にコメントしました")
  end

  # フォローの通知
  def follow_user
    @user_to = params[:user_to]
    @user_from = params[:user_from]
    mail(to: @user_to.email, subject: "#{@user_from.name}があなたをフォローしました")
  end
end
