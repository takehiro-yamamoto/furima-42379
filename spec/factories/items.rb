FactoryBot.define do
  factory :item do
    name               { 'サンプル商品' }
    description        { 'これは商品の説明です。' }
    category_id        { 2 } # 1 は '---' として無効にする前提
    condition_id       { 2 }
    shipping_fee_id    { 2 }
    shipping_area_id   { 2 }
    shipping_day_id    { 2 }
    price              { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
