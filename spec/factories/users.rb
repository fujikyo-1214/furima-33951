FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    nickname              {"tarou"}
    first_name            {"田中"}
    last_name             {"太郎"}
    kana_first_name       {"タナカ"}
    kana_last_name        {"タロウ"}
    birthday              {"1930-01-01"}
  end
end