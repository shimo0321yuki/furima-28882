FactoryBot.define do
  factory :order do
    prefecture_id { 5 }
    postal { '123-456' }
    city { '松本市' }
    address { '平野5-6' }
    building_number { 'セキスイハイム404号'}
    phone { '09876543210' }
    association :item
    association :user
  end
end
