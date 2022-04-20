FactoryBot.define do
  factory :post do
    
    trait :a do
      user_id {"1"}
      term { "テスト" } 
      paraphrase { "テスト" }
      m_category_id {"1"}
    end
    trait :b do
      user_id {"2"}
      term { "テスト2" } 
      paraphrase { "テスト2" }
      m_category_id {"2"}
    end
    trait :c do
      user_id {"3"}
      term { "テスト3" } 
      paraphrase { "テスト3" }
      m_category_id {"3"}
    end

  end
end
