FactoryBot.define do
  factory :post do
    content { Faker::Lorem.sentence}
    images { [File.open("#{Rails.root}/spec/fixtures/test.png")] }
    user
  end
end
