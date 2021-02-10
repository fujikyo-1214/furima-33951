FactoryBot.define do
  factory :purchase_record_address do
    post_number   {'111-1111'}
    prefecture_id {3}
    area          {'松阪市'}
    area_number   {'かめ12-3'}
    building      {'こも123'}
    number        {"09012345678"}
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       {2}
    item_id       {3}
  end
end
