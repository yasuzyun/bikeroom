FactoryBot.define do
  factory :admin do
    email { "admin@gmail.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
  end
end