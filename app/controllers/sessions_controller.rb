class SessionsController < ApplicationController
  def new
  end

  def create
    # Sorcery
    # Takes credentials and returns a user on successful authentication.
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path, success:'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    # Sorcery
    # Resets the session and runs hooks before and after.
    logout
    redirect_to root_url, info: 'ログアウトしました'
  end

end
