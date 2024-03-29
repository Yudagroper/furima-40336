FactoryBot.define do
  factory :market do
    association :user

    goods { Faker::Name.name }
    explan { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    condition_id { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |market|
      market.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end