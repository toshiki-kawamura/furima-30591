require 'rails_helper'

RSpec.describe Crystal, type: :model do
  describe '購入機能' do
    before do
      @crystal = FactoryBot.build(:crystal)
    end

    it '項目が正しく入力されていれば商品の購入ができる' do
      expect(@crystal).to be_valid
    end

    it '郵便番号が必須であること' do
      @crystal.postal_code = nil
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンが必要であること' do
      @crystal.postal_code = 1_111_111
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include('Postal code is invalid')
    end
    it '都道府県が選択されていること' do
      @crystal.prefecture_id = 1
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が必須であること' do
      @crystal.municipality = nil
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が必須であること' do
      @crystal.address = nil
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @crystal.phone_number = nil
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にはハイフンは不要であること' do
      @crystal.phone_number = "111-1111-1111"
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は11桁以内であること' do
      @crystal.phone_number = "111111111111"
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include('Phone number is invalid')
    end
    it 'クレジットカードの情報が必須であること' do
      @crystal.token = nil
      @crystal.valid?
      expect(@crystal.errors.full_messages).to include("Token can't be blank")
    end
  end
end
