FactoryBot.define do
  factory :crystal do
    postal_code    { Faker::Address.postcode }
    prefecture_id  { 2 }
    municipality   { Faker::Address.city }
    address        { Faker::Address.street_address }
    phone_number   { Faker::PhoneNumber.cell_phone }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
