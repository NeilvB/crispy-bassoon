class LoginsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_path
    else
      render :new
    end
  end

  def destroy; end
end
