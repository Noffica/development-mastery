FactoryBot.define do
  factory :article, class: Article do
    trait :no_attributes do
      title { nil }
      body  { nil }
    end

    trait :valid_attributes do
      title { 'A' }
      body  { 'abcd' }
    end
  end
end
