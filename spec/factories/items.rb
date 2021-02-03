FactoryBot.define do
  factory :item do
    item_name {"くまモン"}
    item_explanation {"熊本のゆるキャラ"}
    category_id {"2"}
    condition_id {"2"}
    shipping_cost_id {"2"}
    prefecture_id {"2"}
    arrival_day_id {"2"}
    price            {"77777"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test1.jpg'), filename: 'test1.jpg')
    end
  end
end
