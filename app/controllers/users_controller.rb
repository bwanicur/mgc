class UsersController < ApplicationController
  def new
  end

  def create
  end

  # public facing page
  # use page caching ?
  def show
  end
  
  private
  
  def user_params
    params.require(:user).permit(*USER_PARAMS)
  end
end
