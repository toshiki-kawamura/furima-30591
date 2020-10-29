class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_d6a3edafe5e049a803265a86"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
   def order_params
     params.require(:oreder).permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end
end
