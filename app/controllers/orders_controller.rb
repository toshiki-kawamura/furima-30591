class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @crystal = Crystal.new(order_params)
    if @crystal.valid?
      pay_item
      @crystal.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
    
  end

  private
   def order_params
     params.permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end

   def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
   end

end
