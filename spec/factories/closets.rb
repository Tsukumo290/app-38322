FactoryBot.define do
  factory :closet do
    brand     { 'hoge' }
    price     { 300 }
    genre_id  { 1 }
    color_id  { 1 }
    season_id { 1 }
    size_id   { 1 }
    association :user
  end
end
