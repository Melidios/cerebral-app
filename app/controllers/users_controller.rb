class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  expose(:user)

  def new
  end

  def create
    @user = User.create(params.require(:user).permit(:email,
      :password, :status))
    session[:user_id] = @user.id
    redirect_to '/'
  end

end
