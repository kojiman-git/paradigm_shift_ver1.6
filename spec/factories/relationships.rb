FactoryBot.define do
  factory :relationship do
    trait :a do
      follower_id {"1"}
      followed_id { "2" } 
    end
  end
end
