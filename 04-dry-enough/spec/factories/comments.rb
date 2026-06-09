FactoryBot.define do
  factory :comment do
    user { recipe.user }
    association :recipe
    comment { "Test comment" }
  end
end
