FactoryBot.define do
  factory :buyers_shippings do
    postal_code { '123-4567' }
    region_id { 2 }
    municipality { '横浜市' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { "1234567890" }
    token {"tok_abcdefghijk00000000000000"}
  end
end
