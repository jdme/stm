class SessionsController < ApplicationController

  skip_before_filter :require_auth, :only => [:new, :create]

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      sign_in user
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      @user = User.new(params[:user])
      render :action => :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Logged out!"
  end

  def new
    @user = User.new
  end
end
