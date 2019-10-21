# 投入前に全削除
[User,Post].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table.table_name}")
end

# User
User.create!(name:  "sample",
  email: "sample@sample.com",
  password:              "foobar",
  password_confirmation: "foobar"
)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password
  )
end

# Post
Post.create!(content:  "samplePost"
)

5.times do |n|
  content  = Faker::Lorem.sentence
  Post.create!(content: content)
end
