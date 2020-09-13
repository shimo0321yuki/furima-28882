FactoryBot.define do
  factory :item do
    name { 'あああ' }
    price { '10000' }
    information { 'いいいい' }
    genre_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    area_id { 1 }
    days_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
