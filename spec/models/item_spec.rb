require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do        #createアクション時のテストであることを宣言
    before do
      @item = FactoryBot.build(:item)
    end

    it "image,name,info,category_id,sales_status_id,scheduled_delivery_id,prefecture_id,item_priceが存在すれば商品の登録ができること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録ができないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank") 
    end

    it "nameが空では登録ができないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank", "Name is too short (minimum is 1 character)") 
    end
    
    it "nameが41文字以上では登録ができないこと" do
      @item.name = Faker::Lorem.characters(number: 41)
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)") 
    end
    
    it "infoが空では登録ができないこと" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank") 
    end

    it "infoが1001文字以上では登録ができないこと" do
      @item.info = Faker::Lorem.characters(number: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include("Info is too long (maximum is 1000 characters)") 
    end
    
    it "category_idが空では登録ができないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank") 
    end

    it "category_idが1では登録ができないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank") 
    end

    it "sales_status_idが空では登録ができないこと" do
      @item.sales_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank") 
    end

    it "sales_status_idが1では登録ができないこと" do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank") 
    end

    it "shipping_fee_idが空では登録ができないこと" do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank") 
    end

    it "shipping_fee_idが1では登録ができないこと" do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank") 
    end

    it "scheduled_delivery_idが空では登録ができないこと" do
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank") 
    end

    it "scheduled_delivery_idが1では登録ができないこと" do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank") 
    end

    it "prefecture_idが空では登録ができないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
    end

    it "prefecture_idが1では登録ができないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
    end

    it "item_priceが空では登録ができないこと" do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank") 
    end
    
    it "item_priceの値が299以下の場合登録できないこと" do
      @item.item_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300") 
    end

    it "item_priceの値が100000000以上の場合登録できないこと" do
      @item.item_price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999") 
    end
    
    it "item_priceの値が数値以外の場合登録できないこと" do
      @item.item_price = "aaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is not a number") 
    end
    
  end
  
end
