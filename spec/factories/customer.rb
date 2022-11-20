FactoryBot.define do
  factory :customer do
    first_name   { "test" }
    last_name   { "test" }
    first_name_kana  { "test" }
    last_name_kana  { "test" }
    email  { "testuser1@test.com" }
    password { "test11" }
    password_confirmation { "test11" }
  end
end