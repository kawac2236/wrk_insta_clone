# localeを設定
Faker::Config.locale = :en

# seedsを実行
require './db/seeds/users_seeds'
require './db/seeds/posts_seeds'