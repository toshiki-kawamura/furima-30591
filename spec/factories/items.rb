FactoryBot.define do
  factory :item do
    name                   { Faker::Name.name }
    description            { Faker::Name.name }
    category_id            { 2 }
    product_condition_id   { 2 }
    shipping_charges_id    { 2 }
    shipping_area_id       { 2 }
    days_to_ship_id        { 2 }
    price                  { 500 }
  end
end
