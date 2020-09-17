class PaymentsController < ApplicationController

  def pay
    user = User.find(params[:user_id])
    if user.paid?
      flash[:notice] = "Already paid"
    end

    if user.update(status: 1)
      flash[:notice] = "Successfully paid"
      redirect_to root_path
    else
      flash[:error] = "payment failed!"
    end
  end

  def cancel
    user = User.find(params[:user_id])

    if user.paid && user.update(status: 2)
      flash[:notice] = "Successfully paid"
      redirect_to root_path
    else
      flash[:error] = "Unable to cancel paiment!"
    end
  end
end
