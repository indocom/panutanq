# frozen_string_literal: true

class UsersController < ApplicationController
  #	before_action :authorize_admin, only: :create

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end  
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_user_session_path
  end

  #  private def authorize_admin
  #    return unless !current_user.is_admin?
  #    redirect_to root_path, alert: 'Admins only!'
  #  end

  private def user_params
    params.require(:user).permit(:fullname, :email, :password)
  end
end
