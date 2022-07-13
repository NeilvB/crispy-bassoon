class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    if user_id = session[:user_id]
      @current_user = User.find(user_id)
    else
      redirect_to new_login_url
    end
  end
end
