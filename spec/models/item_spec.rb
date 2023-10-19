require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー出品登録' do
    # describeテスト対象の「クラス」や「メソッド」
    context '出品登録できる場合' do
      it "imageとname、info、category_idなど出品に関する入力が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context 'ユーザーが出品登録ができないとき' do
      it '画像が空では登録できない' do
        @item.image =  nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空で登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空で登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリが空で登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の情報が空で登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it '配送料の負担の情報が空で登録できない' do
        @item.shipping_free_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping free status can't be blank")
      end
      it '配送元の地域の情報が空で登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が空で登録できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '価格の情報が空で登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥299以下は登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it '価格は、¥10,000,000以上は登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it '価格は半角数値以外は登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category １以外の値を選択してください")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status １以外の値を選択してください")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_free_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping free status １以外の値を選択してください")
      end
      it '配送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture １以外の値を選択してください")
      end
      it '配送までの日数に「---」が選択されている場合は出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery １以外の値を選択してください")
      end
        it 'userが紐付いていなければ出品できない'do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end



















