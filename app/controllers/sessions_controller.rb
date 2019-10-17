class SessionsController < ApplicationController
  def new
  end

  def create
    # user = User.find_by(email: session_params[:email])
    # binding.pry
    @user = login(params[:email], params[:password])

    if @user
      # binding.pry
      redirect_back_or_to root_path, success:'ログインしました'
    else
      # binding.pry
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    # session情報は全破棄
    reset_session
    redirect_to root_url, notice: 'ログアウトしました'
  end

end
