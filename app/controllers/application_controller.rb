class ApplicationController < ActionController::Base
  before_action :set_search_posts_form
  # redirect_toなどで使えるflashのタイプを追加する
  add_flash_types :success, :info, :warning, :danger

  private

  def set_search_posts_form
    @search_form = SearchPostsForm.new(search_post_params)
  end

  def search_post_params
    params.fetch(:q, {}).permit(:content)
  end
end
