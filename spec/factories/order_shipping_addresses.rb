FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    address { '道玄坂1-1-1' }
    building { '渋谷ビル10F' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end