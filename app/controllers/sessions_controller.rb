class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    puts user.inspect

    puts "auth? #{user.authenticate(params[:password])}"

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to courses_url
    else
      render :new
    end
  end
end
