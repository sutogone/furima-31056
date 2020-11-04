require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいく時" do
      it "nickname,email,password,password_confirmation,last_name,firstname,last_name_kana,first_name_kana,birthday全て入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
      it "nicknameが空では登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "email登録の際＠が抜けていたら登録できないこと" do
        @user.email = "samplesample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空では登録ができないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "first_nameが空では登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "last_name_kanaが空では登録できないこと" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "first_name_kana空では登録できないこと" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "birthdayが空では登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "emailが重複していては登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが5文字以下の場合登録できないこと" do
        @user.password = "aaa11"
        @user.password_confirmation = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordを半角英字だけ入力すると登録できないこと" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordを半角数字だけ入力すると登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationの値が一致しないとき登録ができないこと" do
        @user.password
        @user.password_confirmation = "bbbb11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameを英字で入力すると登録できないこと" do
        @user.last_name = "tesuto"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameを英字で入力すると登録できないこと" do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameを数字で入力すると登録できないこと" do
        @user.last_name = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameを数字で入力すると登録できないこと" do
        @user.first_name = "456"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaを英字で入力すると登録できないこと" do
        @user.last_name_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaを英字で入力すると登録できないこと" do
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaを数字で入力すると登録できないこと" do
        @user.last_name_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaを数字で入力すると登録できないこと" do
        @user.first_name_kana = "456"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaを半角カナで入力すると登録できないこと" do
        @user.last_name_kana = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaを半角カナで入力すると登録できないこと" do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end
