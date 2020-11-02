# require 'rails_helper'

# RSpec.describe Order, type: :model do
#     describe '購入機能' do
#       before do
#         @order = FactoryBot.build(:order)
#       end

#         it '郵便番号が必須であること' do
#           @order.postal_code = nil
#           @order.valid?
#           expect(@order.errors.full_messages).to include("Purchase must exist")
#         end
#           it '都道府県が選択されていること' do
#             @order.prefecture_id = 1
#             @order.valid?
#             binding.pry
#             expect(@order.errors.full_messages).to include('Purchase must exist')
#           end
#           it '市区町村が必須であること' do
#           end
#           it '番地が必須であること' do
#           end
#           it '電話番号が必須であること' do
#           end

#     end

# # 郵便番号にはハイフンが必要であること（123-4567となる）
# # 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
# # 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# end
