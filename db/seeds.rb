# 投入前に全削除
[User,Post].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table.table_name}")
end

# localeを日本に設定
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
# 1件目の投稿はfirstのユーザー、2件目以降はsecondのユーザー
first_user_id = User.first.id
second_user_id = User.second.id
Post.create!(
  content:  "samplePost",
  images: [
    open("./db/fixtures/post/101.jpg"),
    open("./db/fixtures/post/102.jpg"),
    open("./db/fixtures/post/103.jpg")
  ],
  user_id: first_user_id
)

5.times do |n|
  content  = Faker::Lorem.sentence
  Post.create!(
    content: content,
    images: [
      open("./db/fixtures/post/104.jpg"),
      open("./db/fixtures/post/105.jpg")
    ],
    user_id: second_user_id
  )
end