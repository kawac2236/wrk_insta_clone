class RelationshipsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @user = User.find(params[:followed_id])
    if current_user.follow(@user)
      UserMailer.with(
        user_from: current_user,
        user_to: @user
      ).follow_user.deliver_later
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
