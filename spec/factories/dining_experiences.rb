FactoryBot.define do
  factory :dining_experience do
    association :user
    association :restaurant
    date { "2020-04-29" }
    review { "It was good" }
    rating { 3 }
    price { 1 }
  end
end
