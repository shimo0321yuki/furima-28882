FactoryBot.define do
  factory :purchaser do
    association :item
    association :user
  end
end
