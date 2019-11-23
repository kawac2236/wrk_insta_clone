class ActivitiesController < ApplicationController

  def read
    activity = current_user.activities.find(params[:id])
    activity.read! if activity.unread?
    # activityの種類（action_type)に応じて、リダイレクト先を切り替える
    redirect_to activity.redirect_path
  end
end
