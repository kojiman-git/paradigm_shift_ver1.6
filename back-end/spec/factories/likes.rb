FactoryBot.define do
  factory :like do
    trait :a do
      id   {"1"}
      user_id {"1"}
      post_id { "2" } 
      
    end
  end
end
