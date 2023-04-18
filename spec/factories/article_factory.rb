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

    trait :new_valid_attributes do
      title { 'Updated title' }
      body  { 'Updated body' }
    end

    trait :title_attribute_only do
      title { 'A' }
    end

    trait :body_attribute_only do
      body { 'abcd' }
    end
  end
end
