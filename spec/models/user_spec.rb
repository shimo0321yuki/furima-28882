require 'rails_helper'

RSpec.describe User, type: :model do
  befor do
    @user = FactoyryBot.build(:user)
  end

  discribe 'ユーザー新規登録' do 
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @use.valid?
      expect(@user.errors.full_mesages).to include("Nickname can't be blank")
    end

    it "emailが空では登録ができないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_mesages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_mesages).to include("Email has already been taken")
    end

    it "emailは＠を含む必要があること" do
      @user.email = "abc123"
      @user.valid?
      expect(@user.errors.full_mesages).to include("Email need '@'")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_mesages).to include("password can't be blank")
    end

    it "passwordが５文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_mesages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_mesages).to include("Password confirmation dosen't match Password")
    end

    it "passwordは半角英数字混合であること" do
      @user.password = "あい上オ"
      @user.valid?
      expect(@user.errors.full_mesages).to include("password need alpha-numeral")
    end
  end

  discribe '本人情報確認' do 
    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @use.valid?
      expect(@user.errors.full_mesages).to include("First name can't be blank")
    end

    it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @use.valid?
      expect(@user.errors.full_mesages).to include("Family name can't be blank")
    end

    it "first_nameが全角の漢字平仮名カタカナのどれかでなければならない" do
      @user.first_name = "yamada"
      @user.valid?
      expect(user.errors.full_mesages).to include("First name is 'kannji' or 'hiragana' or 'katakana'")  
    end    

    it "family_nameが全角の漢字平仮名カタカナのどれかでなければならない" do
      @user.family_name = "yamada"
      @user.valid?
      expect(user.errors.full_mesages).to include("Family name is 'kannji' or 'hiragana' or 'katakana'")  
    end    

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @use.valid?
      expect(@user.errors.full_mesages).to include("First name furigana can't be blank")
    end

    it "family_name_kanaが空では登録できないこと" do
      @user.family_name_kana = nil
      @use.valid?
      expect(@user.errors.full_mesages).to include("Family name furigana can't be blank")
    end

    it "first_name_kanaがカタカナでなければならない" do
      @user.first_name_kana = "kana"
      @user.valid?
      expect(user.errors.full_mesages).to include("First name is 'katakana'")      
    end  

    it "family_name_kanaがカタカナでなければならない" do
      @user.family_name_kana = "kana"
      @user.valid?
      expect(user.errors.full_mesages).to include("Family name is 'katakana'")  
    end 

    it "生年月日が必要なこと" do
      @user.birthday = nil
      user.valid?
      expect(user.errors.full_mesages).to include("Brthday can't be blank")
    end
  end
end
