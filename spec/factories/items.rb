FactoryBot.define do
    factory :item do
    association :user 
     
      name              {'リンゴ'}
      info                 {'おいしい'}
      category_id              {2}
      sales_status_id {2}
      shipping_free_status_id          {2}
      prefecture_id          {2}
      scheduled_delivery_id     {2}
      price   {'400'} 
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
      end
    end
  end
