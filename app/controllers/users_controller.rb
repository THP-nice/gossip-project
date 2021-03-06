class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your Gossip account has been created !"
      redirect_to '/'
    else
      flash.now[:alert] = "Your Gossip account creation has failed !"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
