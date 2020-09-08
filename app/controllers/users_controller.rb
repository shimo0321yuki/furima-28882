class UsersController < ApplicationController

  def edit
    @user = User.new(user_params)
    #バリデーションで問題があれば、保存されず「新規登録画面」に戻る
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render 'new'
  end

  def update
    if current_user.update(user_rparams)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

 #ストロングパラメーター
 def user_params
   params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :family_name, :first_name_kana, :family_name_kana, :birthday)
 end
 
end
