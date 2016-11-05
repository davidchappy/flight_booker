class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      PassengerMailer.thank_you(@user).deliver_now
      login(@user)
      flash[:success] = "User created."
      redirect_to root_url
    else
      flash.now[:danger] = "Error with form. Please sign up again."
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
