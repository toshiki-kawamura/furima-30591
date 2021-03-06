require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空だと登録ができない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'password:半角英数混合(半角数字のみ)' do
      @user.password = '1111111'
      @user.password_confirmation = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = 'aaaaaa1'
      @user.password_confirmation = 'aaaaaa1'
      expect(@user).to be_valid
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = 'aaaaaa1'
      @user.password_confirmation = 'aaaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_kanaは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '生年月日が必須であること' do
      @user.date_of_birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end

    it 'emailが登録済みであるとユーザー登録できない' do
      @user.save
      user_a = FactoryBot.build(:user)
      user_a.email = @user.email
      user_a.valid?
      expect(user_a.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていないとユーザー登録できない' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
end
