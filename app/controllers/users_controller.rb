class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # checks if user already exists, if not saves to db
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # This will show all errors including uniqueness if email taken
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
