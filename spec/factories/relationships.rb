FactoryBot.define do
  factory :relationship do
    trait :a do
      id   {"1"}
      follower_id {"1"}
      followed_id { "2" } 
    end
    trait :b do
      id   {"2"}
      follower_id {"1"}
      followed_id { "3" } 
    end
    trait :c do
      id   {"3"}
      follower_id {"3"}
      followed_id { "1" } 
    end
  end
end
