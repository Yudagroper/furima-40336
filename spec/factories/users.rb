FactoryBot.define do
  factory :user do
    handle_name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name { '金田' }
    first_name { '鉄雄' }
    furigana_last { 'カネダ' }
    furigana_first { 'テツオ' }
    birthday { Faker::Date.birthday }
  end
end