class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    User.find(session[:id]).destroy      
    session[:id] = nil         
    redirect_to '/forsale' 
  end  

  private
  def set_user
    @user = User.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:name, :description)
  end
  
end
