require 'rails_helper'

RSpec.describe Item, type: :model do 
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品が保存できる場合' do
   
    it 'imageとnameとdescriptionとcategoryとstateとpostageとregionとshipping_dateとpriceが存在すれば保存できること' do
    
      expect(@item).to be_valid
    end
  end

  context '商品が保存できない場合' do
    
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  
    it 'nameが空では保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが{1]では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'state_idが{1}では保存できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end

    it 'postage_idが{1}では保存できないこと' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it 'region_idが{1}では保存できないこと' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end

    it 'shipping_date_idが{1}では保存できないこと' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end

    it 'priceが空では保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300以下では保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it 'priceが¥9999999以上では保存できないこと' do
      @item.price = 10000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

    it 'priceが全角文字では登録できないこと' do
      @item.price = '嗚呼嗚呼あ１１１AA'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceが半角英数混合では登録できないこと' do
      @item.price = 'aaa11111'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceが半角英語だけでは登録できないこと' do
      @item.price = 'aaaaiii'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
