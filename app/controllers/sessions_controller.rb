class SessionsController < ApplicationController
  def new
  end

  def create

    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to home_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    logout
    redirect_to home_url, notice: 'Logged out!'
  end
end
