require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @buy = FactoryBot.build(:buy, user_id: @user.id, item_id: @item.id)
    end

    it "必須項目が全て入力されていれば購入できること" do
      expect(@buy).to be_valid 
    end
    
    it "buildingが無くても購入できること" do
      @buy.building = nil
      expect(@buy).to be_valid
    end

    it "tokenがない場合購入ができないこと" do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空の場合購入ができないこと" do
      @buy.postal_code = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end

    it "postal_codeにハイフンがないと購入ができないこと" do
      @buy.postal_code = 1234567
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefecture_idが空の場合購入ができないこと" do
      @buy.prefecture_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it "prefecture_idが1の場合購入ができないこと" do
      @buy.prefecture_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "cityが空の場合購入ができないこと" do
      @buy.city = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
    end

    it "addressがない場合購入ができないこと" do
      @buy.address = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空の場合購入ができないこと" do
      @buy.phone_number = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberに数字以外を入力すると購入ができないこと" do
      @buy.phone_number = "電話番号"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberを11文字以上入力すると購入ができないこと" do
      @buy.phone_number = 012011111111
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
  end
end