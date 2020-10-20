class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :product_condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
  end


end
