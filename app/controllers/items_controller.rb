class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
