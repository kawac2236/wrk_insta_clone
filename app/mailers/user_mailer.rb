class UserMailer < ApplicationMailer
	default from: 'notifications-insta-clone@example.com'
	# 仮実装
	def like_post
		@post = params[:post]
		@user_to = params[:user_to]
		@user_from = params[:user_from]
    mail(to: @user_to.email, subject: "#{@user_from.name}があなたの投稿にいいねしました")
  end
end
