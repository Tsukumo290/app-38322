FactoryBot.define do
  factory :memo do
    content { 'hoge' }
    association :user
    association :closet
  end
end
