# 投入前に全削除
[User,Post].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table.table_name}")
end

# localeを設定
Faker::Config.locale = :en

# User
User.create!(
  name:  "sampleUser",
  email: "sample@sample.com",
  password:              "foobar",
  password_confirmation: "foobar"
)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.com"
  password = "password"
  User.create!(
    name:  name,
    email: email,
    password:              "password",
    password_confirmation: "password"
  )
end

# Post
puts ' "Post" を作成開始します ...'
User.limit(5).each do |user|
  post = user.posts.create(
    content:Faker::Lorem.sentence,
    remote_images_urls: %w[https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random]
  )
  puts "post#{post.id} が作成されました"
end