class SessionsController < ApplicationController

  def new
    @session_user = User.new
  end

def create
    if user = login(params[:email], params[:password])
      flash[:success] = "Welcome to MGC"
      redirect_to auth_root_path
    else
      flash.now[:error] = "There was a problem"
      @session_user = User.new(email: params[:email])
      render :new
    end
  end

  def destroy
    logout
    redirect_to sessions_path
  end

end
