require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'ニックネームが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blnak")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@を含まないは登録できない' do
        @user.email = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未難では登録できない' do
        @user.password = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minium is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｔｅｓｔ123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'パスワード(再入力)が不一致では登録できない' do
        @user.password_confirmation = 'test456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password comfirmation dosen't match Password")
      end

      it '姓が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '姓に半角文字が含まれていると登録できない' do
        @user.last_name = 'name123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it '名が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名に半角文字が含まれていると登録できない' do
        @user.first_name = 'name123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it '姓(カナ)が空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it '姓(カナ)にカタカナ以外の文字(平仮名・漢字・英数字・記号)が含まれていると登録できない' do
        @user.kana_last_name = 'name123'
        @user.valid?
        expect(@user.errors.full_messages).to include("kana last name is invalid. Input full-width katakana characters")
      end

      it '名(カナ)が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it '名(カナ)にカタカナ以外の文字(平仮名・漢字・英数字・記号)が含まれていると登録できない' do
        @user.kana_first_name = 'name123'
        @user.valid?
        expect(@user.errors.full_messages).to include("kana first name is invalid. Input full-width katakana characters")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday date can't be blank")
      end
    end
  end
end
