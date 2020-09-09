class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_action :authenticate_user!
  # before_filter :authenticate_user! #, :except=>[:hello]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: [:nickname, :email, :password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birthday])
  end

  # def create
  #   item = Item.create!(item_params)
  #   redirect_to item
  # end   いるのかな？

  private

    # def item_params
    #   params.require(:item).permit(:images [])
    # end   いるのかな？

    def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end

# ENV["BASIC_AUTH_USER"]
# ENV["BASIC_ATH_PASSWORD"]
