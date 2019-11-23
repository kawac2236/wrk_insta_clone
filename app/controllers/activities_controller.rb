class ActivitiesController < ApplicationController

  def read
    activity = current_user.activities.find(params[:id])
    activity.read! if activity.unread?
    redirect_to mypage_activities_path
  end
end
