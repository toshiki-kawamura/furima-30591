FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    last_name             { Faker::Name.name }
    first_name            { Faker::Name.name }
    last_name_kana        { 'マコ' }
    first_name_kana       { 'ユキナリ' }
    date_of_birth         { '1991/01/01' }
  end
end
