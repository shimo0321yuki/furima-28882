require 'rails_helper'

RSpec.describe User, type: :model do
  befor do
    @user = FactoyryBot.build(:user)
  end

  discribe 'ユーザー新規登録'　do 
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
    end
    
    it "nicknameが空では登録できないこと" do
    end

    it "emailが空では登録ができないこと" do
    end

    it "重複したemailが存在する場合登録できないこと" do
    end

    it "emailは＠を含み必要があること" do
    end

    it "passwordが空では登録できないこと" do
    end

    it "passwordは半角ポリゴン混合であること" do
    end

    it "passwordが５文字以下であれば登録できないこと" do
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
    end

    it "新規登録・ログイン共にエラーハンドリングができていること"
    end
  end

  discribe '本人情報確認'　do 
    it "ユーザー本名が全角（漢字・平仮名・カタカナ）で名字と名前がそれぞれ入力されていること" do
    end

    it "ユーザー本名のフリガナがカタカナで名字と名前でそれぞれ必要なこと" do
    end

    it "生年月日が必要なこと" do
    end
  end
end
