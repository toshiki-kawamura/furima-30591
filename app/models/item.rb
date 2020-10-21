class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, :condition, :days_to_ship, :shipping_area, :shipping_charge

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
    validates :genre_id, numericality: { other_than: 1 } 
  end


end
