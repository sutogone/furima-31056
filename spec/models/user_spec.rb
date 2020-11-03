require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:f_user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいく時" do
      it "nickname,email,password,password_confirmation,last_name,firstname,last_name_kana,first_name_kana,birthday全て入力されていれば登録できる" do
        
      end
      it "passwordが6文字以上かつ、英数字があれば登録できる" do
        
      end
    end

    context "新規登録がうまくいかない時" do
      it "nicknameが空では登録できないこと" do
        
      end
      it "emailが空では登録できないこと" do
        
      end
      it "passwordが空では登録できないこと" do
        
      end
      it "password_confirmationが空では登録ができないこと" do
        
      end
      it "last_nameが空では登録できないこと" do
        
      end
      it "first_nameが空では登録できないこと" do
        
      end
      it "last_name_kanaが空では登録できないこと" do
        
      end
      it "first_name_kana空では登録できないこと" do
        
      end
      it "birthdayが空では登録できないこと" do
        
      end
      it "emailが重複していては登録できないこと" do
        
      end
      it "passwordが5文字以下の場合登録できないこと" do
        
      end
      it "passwordを半角英字だけ入力すると登録できないこと" do
        
      end
      it "passwordを半角数字だけ入力すると登録できないこと" do
        
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        
      end
      it "passwordとpassword_confirmationの値が一致しないとき登録ができないこと" do
        
      end
      it "last_name,first_nameを英字で入力すると登録できないこと" do
        
      end
      it "last_name,first_nameを数字で入力すると登録できないこと" do
        
      end
      it "last_name_kana,first_name_kanaを英字で入力すると登録できないこと" do
        
      end
      it "last_name_kana,first_name_kanaを数字で入力すると登録できないこと" do
        
      end
      it "last_name_kana,first_name_kanaを半角カナで入力すると登録できないこと" do
        
      end
    end
  end
end
