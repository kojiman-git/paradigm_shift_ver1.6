FactoryBot.define do
  factory :m_category do
    trait :a do
      id { 1 }
      name { "英語" }
    end

    trait :b do
      id { 2 }
      name { "数学" }
    end

    trait :c do
      id { 3 }
      name { "国語" }
    end

    trait :d do
      id { 4 }
      name { "理科" }
    end

    trait :e do
      id { 5 }
      name { "社会" }
    end

    trait :e do
      id { 6 }
      name { "その他" }
    end


  end
end
