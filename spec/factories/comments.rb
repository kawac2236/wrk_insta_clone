FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence}
    after(:build) do |comment|
      comment.user = FactoryBot.create(:user)
      comment.post = FactoryBot.create(:post, user: comment.user)
    end
  end
end