FactoryBot.define do
  factory :favorite do
    association :user
    association :closet
  end
end
