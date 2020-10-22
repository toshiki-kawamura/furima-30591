require 'rails_helper'

RSpec.describe Item, type: :model do
  describe'商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
  it '商品画像を1枚つけることが必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it '商品名が必須であること' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
 
  it '商品の説明が必須であること' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  
  it '商品の状態についての情報が必須であること' do
    @item.product_condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Product condition must be other than 1")
  end
  it '配送料の負担についての情報が必須であること' do
    @item.shipping_charges_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
  end
  it '発送元の地域についての情報が必須であること' do
    @item.shipping_area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
  end
  
  it '発送までの日数についての情報が必須であること' do
    @item.days_to_ship_id  = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
  end

  it '価格についての情報が必須であること' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格の範囲が、¥300~¥9,999,999の間であること' do
    @item.price = 100
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end

  it '販売価格は半角数字のみ保存可能であること' do
    @item.price = "５００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end


 end

end
