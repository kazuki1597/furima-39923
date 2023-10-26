require 'rails_helper'

RSpec.describe PayPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @tesut = FactoryBot.build(:pay_purchases, user_id: user.id, item_id: item.id)
                            # :は文字列         キー＝カラム（状況による）  バリュー＝情報   キーバリューはイコール            
  end

  describe '購入に対し問題なく登録できること' do
    # describeテスト対象の「クラス」や「メソッド」
    context '購入できる場合' do
      it "カード情報や出品先など購入に必要な入力が存在すれば登録できる" do
        expect(@tesut).to be_valid
      end

      it "建物名が空でも登録できる" do
        @tesut.building  =  ''
        expect(@tesut).to be_valid
      end
    end

    context 'ユーザーが出品物を購入できない場合' do
      it 'tokenが空で登録' do
        @tesut.token =  ''
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空で登録できない' do
        @tesut.postal_code = ''
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が-が必要' do
        @tesut.postal_code = '1111111'
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Postal code 郵便番号を入力してください")
      end
      it '都道府県が空で登録できない' do
        @tesut.prefecture_id = 0
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '住所が空で登録できない' do
        @tesut.city  = ''
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空で登録できない' do
        @tesut.addlesses = ''
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Addlesses can't be blank")
      end
      it '電話番号が空で登録できない' do
        @tesut.phone_number = ''
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Phone number 電話番号を入力してください")
      end
      it '電話番号9桁以下では登録できない' do
        @tesut.phone_number = '111111111'
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Phone number 電話番号を入力してください")
      end
      it '電話番号12桁以上では登録できない' do
      @tesut.phone_number = '111111111111'
      @tesut.valid?
      expect(@tesut.errors.full_messages).to include("Phone number 電話番号を入力してください")
      end
      it '電話番号を全角で登録できない' do
        @tesut.phone_number = '１１１１１１１１１１'
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("Phone number 電話番号を入力してください")
      end
      it 'user_idが空だと登録できない' do
        @tesut.user_id = nil
        @tesut.valid?
        expect(@tesut.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと登録できない' do
            @tesut.item_id = nil
            @tesut.valid?
            expect(@tesut.errors.full_messages).to include("Item can't be blank")
            end
    end
  end
end