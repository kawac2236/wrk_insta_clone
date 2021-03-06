source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# viewテンプレートにslimを使用する
gem 'slim-rails'
# Lintチェックを行う（安定バージョンに固定）
gem 'rubocop', '~> 0.75.1', require: false
gem 'rubocop-rails'

# パスワード暗号化
gem 'sorcery'
# セッション管理
gem 'redis-rails'
# 国際化対応
gem 'rails-i18n', '~> 5.1' # For 5.0.x, 5.1.x and 5.2.x
# サンプルデータ作成
gem 'faker'
# 画像アップロード
gem 'carrierwave'
gem 'mini_magick'
# 定数管理
gem 'config'
# ページネーション
gem 'kaminari'
# 非同期処理
gem 'sidekiq'
# ダッシュボードを利用するため
gem 'sinatra', require: false

gem 'jquery-rails'
gem 'bootstrap', '>= 4.3.1'
gem 'material-sass', '4.1.1'
gem 'material_icons'

gem 'font-awesome-sass'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # pryを使用する
  gem 'pry-rails'
  gem 'pry-byebug'
  # テストにはRSpecを利用する
  gem 'rspec-rails', '~> 3.8.0'
  # fixture
  gem 'factory_bot_rails'
  # 統合テスト
  gem 'capybara'
  gem 'webdrivers'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # モデルにコメントをつける
  gem 'annotate'
  # エラーを見やすくする
  gem 'better_errors'
  gem 'binding_of_caller'
  # テスト時間を短くする
  gem 'spring-commands-rspec'
  # メールのローカル確認
  gem 'letter_opener_web'
  # デプロイ
  gem 'capistrano'
  # capistranoに必要な依存関係
  gem 'ed25519', '>= 1.2', '< 1.3'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  # 関連するgem
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-nginx'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
