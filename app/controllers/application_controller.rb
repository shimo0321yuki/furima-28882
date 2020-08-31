class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_filter :authenticate_user! #, :except=>[:hello]


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_ATH_PASSWORD"]
    end
  end
end