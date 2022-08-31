FactoryBot.define do
  factory :user do
    name                  {"hoge"}
    email                 {"hoge@email"}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    prefecture_code       { 13 }
  end
end