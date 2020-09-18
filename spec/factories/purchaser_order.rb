FactoryBot.define do
  factory :purchaser_order do
    prefecture_id { 5 }
    postal { '123-4567' }
    city { '松本市' }
    address { '平野5-6' }
    building_number { 'セキスイハイム404号' }
    phone { '09876543210' }
    token { 'tok_hogefuga1234' }
  end
end
