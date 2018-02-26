class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.find(
      email: params[:email],
      password: params[:password]
    )
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end
end
