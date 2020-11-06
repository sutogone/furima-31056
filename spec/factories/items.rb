FactoryBot.define do
  factory :item do
    association :user
    name                    {Faker::Games::LeagueOfLegends.champion}
    info                    {Faker::Lorem.sentence}
    category_id             {Faker::Number.between(from: 2, to: 11)}
    sales_status_id         {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id         {Faker::Number.between(from: 2, to: 3)}
    scheduled_delivery_id   {Faker::Number.between(from: 2, to: 4)}
    prefecture_id           {Faker::Number.between(from: 2, to: 48)}
    item_price              {Faker::Number.between(from: 300, to: 9_999_999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
