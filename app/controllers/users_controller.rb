class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # checks if user already exists, if not saves to db
  def create
    if User.exists?(email: user_params[:email])
      flash[:alert] = "A user with that email already exists"
      redirect_to "/register"
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/"
      else
        flash[:alert] = "There was a problem creating your account"
        redirect_to "/register"
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
