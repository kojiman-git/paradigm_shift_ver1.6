FactoryBot.define do
  factory :relationship do
    trait :a do
      follower_id {"1"}
      followed_id { "2" } 
    end
    trait :b do
      follower_id {"1"}
      followed_id { "3" } 
    end
    trait :c do
      follower_id {"3"}
      followed_id { "1" } 
    end
  end
end
