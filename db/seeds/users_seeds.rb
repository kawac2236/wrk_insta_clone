# User
puts ' "User" を作成開始します ...'
20.times do |n|
  user = User.create!(
    name:  Faker::Name.name,
    email: Faker::Internet.unique.email,
    password:              "password",
    password_confirmation: "password"
  )
  puts "user #{user.name} が作成されました。"
end
