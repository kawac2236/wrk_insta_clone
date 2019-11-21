class Mypage::ActivitiesController < ApplicationController
  def index
    @notifications = current_user.activities
  end
end
