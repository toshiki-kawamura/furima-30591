class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private
  # def order_params
    # params.require(:oreder).permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  # end
end
