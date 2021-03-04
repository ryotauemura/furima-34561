require 'rails_helper'

RSpec.describe BuyersShippings, type: :model do
  describe '購入者情報と配送先情報' do
    before do
      user = FactoryBot.create(:user)
      @buyer_shipping = FactoryBot.build(:buyers_shippings,user_id: user.id)
    end

    context '購入者情報と配送先情報が保存できる場合' do

      it '全ての値が正しく入力されていれば保存できること' do
       expect(@buyer_shipping).to be_valid
      end
 
      it 'buildingは空でも保存できること' do
       @buyer_shipping.building = ''
       expect(@buyer_shipping).to be_valid
      end
 
    end
 
    context '購入者情報と配送先情報が保存できない場合' do
 
      it 'postal_codeが空だと保存できないこと' do
       @buyer_shipping.postal_code = ''
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
 
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
       @buyer_shipping.postal_code = '1234567'
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
 
      it 'reigon_idを選択しないと保存できないこと' do
       @buyer_shipping.region_id = 1
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Region can't be blank")
      end
 
      it 'municipalityが空だと保存できないこと' do
       @buyer_shipping.municipality = ''
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
 
      it 'addressが空だと保存できないこと' do
       @buyer_shipping.address = ''
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Address can't be blank")
      end
 
      it 'phone_numberが空では保存できないこと' do
       @buyer_shipping.phone_number = ''
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
 
      it 'phone_numberが半角英数字以外では保存できないこと' do
       @buyer_shipping.phone_number = 'aaaaaあ'
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
       @buyer_shipping.token = nil
       @buyer_shipping.valid?
       expect(@buyer_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
