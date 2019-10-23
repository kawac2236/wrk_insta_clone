# Post
puts ' "Post" を作成開始します ...'
image_id = 1
User.limit(20).each do |user|
  post = user.posts.create(
    content:Faker::Lorem.sentence,
    images: [
      open("./db/fixtures/post_images/image_#{image_id.to_s}.jpg"),
      open("./db/fixtures/post_images/image_#{(image_id + 1).to_s}.jpg")
    ]
  )
  image_id += 2
  puts "post#{post.id} が作成されました"
end