FactoryBot.define do
  factory :tweet do
  association :user

  title {Faker::Lorem.sentence}
  text {Faker::Lorem.sentence}
  after(:build) do |tweet|
    tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end

