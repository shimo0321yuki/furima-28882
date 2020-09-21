require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録ができないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'emailは＠を含む必要があること' do
      @user.email = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが５文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordは半角英数字混合であること' do
      @user.password = 'あい上オ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
  end

  describe '本人情報確認' do
    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'first_nameが全角の漢字平仮名カタカナのどれかでなければならない' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は不正な値です")
    end

    it 'family_nameが全角の漢字平仮名カタカナのどれかでなければならない' do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のフリガナを入力してください")
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナを入力してください")
    end

    it 'first_name_kanaがカタカナでなければならない' do
      @user.first_name_kana = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のフリガナは不正な値です")
    end

    it 'family_name_kanaがカタカナでなければならない' do
      @user.family_name_kana = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナは不正な値です")
    end

    it '生年月日が必要なこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
