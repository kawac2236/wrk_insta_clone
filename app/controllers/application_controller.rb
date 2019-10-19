class ApplicationController < ActionController::Base
  # redirect_toなどで使えるflashのタイプを追加する
  add_flash_types :success, :info, :warning, :danger
end
