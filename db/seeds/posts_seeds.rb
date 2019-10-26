# Post
puts ' "Post" を作成開始します ...'
User.limit(20).each do |user|
  post = user.posts.create(
    content:Faker::Lorem.sentence,
    remote_images_urls: %w[https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random]
  )
  puts "post#{post.id} が作成されました"
end