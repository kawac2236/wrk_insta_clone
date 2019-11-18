class Mypage::AccountsController < Mypage::BaseController  
  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to edit_mypage_account_path, success: 'プロフィールの更新に成功しました'
    else
      flash.now['danger'] = 'プロフィールの更新に失敗しました'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :avatar_cache, :name)
  end
end
