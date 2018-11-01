class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(username: params["user"]["username"], email: params["user"]["email"], password: params["user"]["password"])
    redirect_to '/'
  end
end
