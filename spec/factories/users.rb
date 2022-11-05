FactoryBot.define do
  factory :user do
  
  # このようなトレイト名を、テストコード内で見かけとして一体どんなデータができるのか検討がつかないと思います
  # どういうデータができるのかわかるような名前にした方がいいです
  trait :a do
    id   {"1"}
    name {"森田翔一"}
    email { "test@test.com" } 
    password { "testpassword" }
  end
  trait :b do
    id   {"2"}
    name {"永瀬浩一"}
    email { "nagase@test.com" } 
    password { "testpassword" }
  end
  trait :c do
    id  {"3"}
    name {"鈴木健一"}
    email { "suzuki@test.com" } 
    password { "testpassword" }
  end

 
  end
end
