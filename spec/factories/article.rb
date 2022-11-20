FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 100) }
    user_id { "1" }
    likes_count { "0" }
  end
end