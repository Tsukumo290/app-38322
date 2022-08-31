FactoryBot.define do
  factory :calendar do
    start_time { '1962-08-07 00:00:00' }
    association :user
  end
end
