class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge

  belongs_to :user
  has_many   :comments
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :product_condition_id, numericality: { other_than: 1 } 
    validates :shipping_charges_id, numericality: { other_than: 1 } 
    validates :shipping_area_id, numericality: { other_than: 1 } 
    validates :days_to_ship_id, numericality: { other_than: 1 } 
    validates :price
    
  end


end
