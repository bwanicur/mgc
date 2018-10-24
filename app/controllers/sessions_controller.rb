class SessionsController < ApplicationController
  layout 'login'
  
  def new
    @session_user = User.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to backstage_root_path
    else
      flash.now[:error] = "There was a problem"
      @session_user = User.new(email: params[:email])
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_path
  end
end
