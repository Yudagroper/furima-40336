require 'rails_helper'
RSpec.describe Market, type: :model do
  before do
    @market = FactoryBot.create(:market)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@market).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @market.category_id = 1
        expect(@market).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @market.condition_id = 1
        expect(@market).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @market.shipping_fee_id = 1
        expect(@market).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @market.prefecture_id = 1
        expect(@market).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @market.shipping_day_id = 1
        expect(@market).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @market.price = 300
        expect(@market).to be_valid
      end
    end

    context '出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @market.image = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @market.goods = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Goods can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @market.explan = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Explan can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @market.category_id = 0
        @market.valid?
        expect(@market.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @market.category_id = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @market.condition_id = 0
        @market.valid?
        expect(@market.errors.full_messages).to include('Condition must be other than 0')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @market.condition_id = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @market.shipping_fee_id = 0
        @market.valid?
        expect(@market.errors.full_messages).to include('Shipping fee must be other than 0')
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @market.shipping_fee_id = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @market.prefecture_id = 0
        @market.valid?
        expect(@market.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @market.prefecture_id = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @market.shipping_day_id = 0
        @market.valid?
        expect(@market.errors.full_messages).to include('Shipping day must be other than 0')
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @market.shipping_day_id = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空だと出品できない' do
        @market.price = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @market.price = '３00'
        @market.valid?
        expect(@market.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300円未満だと出品できない' do
        @market.price = 100
        @market.valid?
        expect(@market.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9,999,999円を超えると出品できない' do
        @market.price = 10_000_000
        @market.valid?
        expect(@market.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end