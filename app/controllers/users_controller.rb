class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      render json: @user
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
