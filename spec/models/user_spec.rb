require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての入力事項、存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it '名字が全角の漢字・ひらがな・カタカナであれば登録できる' do
        @user.last_name = '金田'
        expect(@user).to be_valid
      end
      it '名前が全角の漢字・ひらがな・カタカナであれば登録できる' do
        @user.first_name = '鉄雄'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角のカタカナであれば登録できる' do
        @user.furigana_first = 'カネダ'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角のカタカナであれば登録できる' do
        @user.furigana_last = 'テツオ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくかないとき' do
      it 'ハンドルネームが空欄だと保存できない' do
        @user.handle_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Handle name can't be blank")
      end
      it 'メールアドレスが空欄だと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスがすでに登録しているユーザーと重複していると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        # binding.pry
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが空欄だと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password Include both letters and numbers', "Password confirmation doesn't match Password")
      end
      it 'パスワード（確認含む）が5文字以下だと保存できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワード（確認含む）が半角英数字でないと保存できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワード（確認）が空欄だと保存できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が全角の漢字・ひらがな・カタカナでないと登録できない' do
        @user.last_name = 'kaneda'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it '名前が全角の漢字・ひらがな・カタカナでないと登録できない' do
        @user.first_name = 'tetsuo'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名字のフリガナが全角のカタカナでないと登録できない' do
        @user.furigana_last = 'かねだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana last is invalid')
      end
      it '名前のフリガナが全角のカタカナでないと登録できない' do
        @user.furigana_first = 'てつお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana first is invalid')
      end
      it '生年月日が空欄だと保存できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end