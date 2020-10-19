require 'rails_helper'

  RSpec.describe User, type: :model do
    describe 'ユーザー新規登録' do
      before do
        @user = FactoryBot.build(:user)
      end
  
      it "nicknameが空だと登録ができない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaが空では登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空では登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it 'password:半角英数混合(半角英語のみ)' do
        binding.pry
        @user.password = 'aaaaaaa'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

  #     it 'パスワードは、確認用を含めて2回入力すること' do
  #     end

  #     it'パスワードとパスワード（確認用）、値の一致が必須であること'do
  #     end

  #     it'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること'do

  #   end

  #   it '生年月日が必須であること'do
  # end

    


    end
  end
