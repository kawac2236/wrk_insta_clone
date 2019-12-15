class Mypage::NotificationsController < Mypage::BaseController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to edit_mypage_notification_path, success: '設定を更新しました'
    else
      flash.now['danger'] = '設定の更新に失敗しました'
      render :notifications
    end
  end

  private
  def user_params
    params.require(:user).permit(:notification_on_comment, :notification_on_follow, :notification_on_like)
  end
end
