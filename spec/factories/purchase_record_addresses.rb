FactoryBot.define do
  factory :purchase_record_address do
    post_number   {'111-1111'}
    prefecture_id {3}
    area          {'松阪市'}
    area_number   {'かめ12-3'}
    building      {'こも123'}
    number        {"09012345678"}
  end
end
