require 'rails_helper'

RSpec.describe Item, type: :model do
  describe'商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
  it '商品画像を1枚つけることが必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User must exist")
  end
  it '商品名が必須であること' do
  
  end
 
  it '商品の説明が必須であること' do
  
  end
  it 'カテゴリーの情報が必須であること' do
    
  end
  it '商品の状態についての情報が必須であること' do
    
  end
  it '配送料の負担についての情報が必須であること' do
    
  end
  it '発送元の地域についての情報が必須であること' do
    
  end
  
  it '発送までの日数についての情報が必須であること' do
    
  end

  it '価格についての情報が必須であること' do
    
  end

  it '価格の範囲が、¥300~¥9,999,999の間であること' do
    
  end

  it '販売価格は半角数字のみ保存可能であること' do
    
  end

  it '入力された販売価格によって、販売手数料や販売利益の表示が変わること' do
    
  end


 end

end
