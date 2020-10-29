class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @crystal = Crystal.new(order_params)
    if @crystal.valid?
      @crystal.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
    # @order = Order.new(order_params)
    # if @order.valid?
    #   Payjp.api_key = "sk_test_d6a3edafe5e049a803265a86"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    #   Payjp::Charge.create(
    #     amount: order_params[:price],  # 商品の値段
    #     card: order_params[:token],    # カードトークン
    #     currency: 'jpy'                 # 通貨の種類（日本円）
    #   )
    #   @order.save
    #   return redirect_to root_path
    # else
    #   render 'index'
    # end
  end

  private
   def order_params
     params.permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
   end
end
