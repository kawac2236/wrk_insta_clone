class Mypage::ActivitiesController < Mypage::BaseController
  def index
    @notifications = current_user.activities
  end
end
