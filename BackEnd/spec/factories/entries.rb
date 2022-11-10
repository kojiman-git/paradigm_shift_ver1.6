FactoryBot.define do
  factory :entry do
    trait :a do
      id   {"1"}
      user_id {"1"}
      room_id { "1" } 
    end
    trait :b do
      id   {"2"}
      user_id {"2"}
      room_id { "1" } 
    end
  end
end
