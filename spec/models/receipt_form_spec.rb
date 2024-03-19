require 'rails_helper'

RSpec.describe ReceiptForm, type: :model do
  before do
    @receipt_form = FactoryBot.build(:receipt_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@receipt_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @receipt_form.user_id = 1
        expect(@receipt_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @receipt_form.market_id = 1
        expect(@receipt_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @receipt_form.postcode = '123-4560'
        expect(@receipt_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @receipt_form.prefecture_id = 1
        expect(@receipt_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @receipt_form.municipalities = '横浜市'
        expect(@receipt_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @receipt_form.street_address = '旭区１２３'
        expect(@receipt_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @receipt_form.building = nil
        expect(@receipt_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @receipt_form.telephone_number = 12_345_678_910
        expect(@receipt_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @receipt_form.user_id = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @receipt_form.market_id = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Market can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @receipt_form.postcode = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @receipt_form.postcode = 1_234_567
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @receipt_form.prefecture_id = 0
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @receipt_form.prefecture_id = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @receipt_form.municipalities = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Municipalitie can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @receipt_form.street_address = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Street_address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @receipt_form.telephone_number = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @receipt_form.telephone_number = '123 - 1234 - 1234'
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @receipt_form.telephone_number = 12_345_678_910_123_111
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @receipt_form.token = nil
        @receipt_form.valid?
        expect(@receipt_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
