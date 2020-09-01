FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confimation {password}
    first-name {Faker::Name.first_name}
    family-name {Faker::Name.family_name}
    first-name-kana {Faker::Name.first_name_kana}
    family-name-kana {Faker::Name.family_name_kana}
    birthday {Faker::Date.birthday}
  end
end
