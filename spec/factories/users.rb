FactoryBot.define do
  factory :user do
  
  trait :a do
    name {"森田翔一"}
    email { "test@test.com" } 
    password { "testpassword" }
  end
  trait :b do
    name {"永瀬浩一"}
    email { "nagase@test.com" } 
    password { "testpassword" }
  end
  trait :c do
    name {"鈴木健一"}
    email { "suzuki@test.com" } 
    password { "testpassword" }
  end

 
  end
end
