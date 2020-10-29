class Crystal
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number
  end

  def save
    purchase_id = item_id
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, building_name: building_name, address: address, phone_number: phone_number, purchase_id: purchase_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end
