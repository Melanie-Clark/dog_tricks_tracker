class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, allow_other_host: true
      puts "Success - User already registered"
    else
      redirect_to "/signin", allow_other_host: true
      puts "User not registered or incorrect password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
