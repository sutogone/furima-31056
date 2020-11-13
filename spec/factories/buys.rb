FactoryBot.define do
  factory :buy do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '日本市' }
    address { '日ノ本2-3-4' }
    phone_number { '09012345678' }
    building { '日本ビル'}
    association :user
    association :item
  end
end
