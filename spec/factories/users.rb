FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email    { Faker::Internet.free_email }
    password { 'abc000' }
    password_confirmation { password }
    birthday { Faker::Date.birthday }

    gimei = Gimei.name
    first_name { gimei.last.kanji }
    family_name { gimei.first.kanji }
    first_name_kana { gimei.last.katakana }
    family_name_kana { gimei.first.katakana }
  end
end
