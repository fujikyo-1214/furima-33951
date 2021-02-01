require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる時' do
      it "email,password,password_confirmation,nickname,first_name,last_name,kana_first_name,kana_last_name,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数を含んだ6文字以上であれば登録できる" do
        @user.password = "a12345"
        @user.password_confirmation = "a12345"
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user,email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@を含んでいない場合登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "a1234"
        @user.password_confirmation = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "a12345"
        @user.password_confirmation = "a23456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password:半角英数混合(半角英語のみ)" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "password:半角英数混合(半角数字のみ)" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが漢字・ひらがな・カタカナ以外では登録できない" do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが漢字・ひらがな・カタカナ以外では登録できない" do
        @user.last_name = "bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "kana_first_nameが全角カタカナ以外では登録できない" do
        @user.kana_first_name = "cccc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
      it "kana_last_nameが全角カタカナ以外では登録できない" do
        @user.kana_last_name = "dddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it "kana_first_nameが空では登録できない" do
        @user.kana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "kana_last_nameが空では登録できない" do
        @user.kana_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
