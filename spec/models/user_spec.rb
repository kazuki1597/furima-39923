require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
    end
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "お名前(全角)は、苗字がそれぞれ必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 設定してください")
    end
    it "お名前(全角)は、名前がそれぞれ必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 設定してください")
    end
    it "お名前(全角)は、苗字が全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'kk'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 設定してください")
    end
    it "お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = 'kk'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 設定してください")
    end
    it "お名前カナ(全角)は、名字がそれぞれ必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 設定してください")
    end
    it "お名前カナ(全角)は、名前がそれぞれ必須であること" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "お名前カナ(全角)は、苗字が全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 設定してください")
    end
    it "お名前カナ(全角)は、名前が全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana  = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 設定してください")
    end
    it "生年月日が必須であること" do
      @user.birth_date  = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end