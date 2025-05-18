class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to "/", allow_other_host: true
      puts "Success - User already registered"
    else
      redirect_to "/login", allow_other_host: true
      puts "User not registered or incorrect password"
    end
  end
end
