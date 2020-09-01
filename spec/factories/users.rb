FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confimation {password}
    first_name {Faker::Name.first_name}
    family_name {Faker::Name.family_name}
    first_name_kana {Faker::Name.first_name_kana}
    family_name_kana {Faker::Name.family_name_kana}
    birthday {Faker::Date.birthday}
  end
end
