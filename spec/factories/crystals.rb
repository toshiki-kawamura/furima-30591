FactoryBot.define do
  factory :crystal do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipality   { Faker::Address.city }
    address        { Faker::Address.street_address }
    phone_number   { '99999999999' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
