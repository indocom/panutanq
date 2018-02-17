# frozen_string_literal: true

class UsersController < ApplicationController
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

  def authorize
    user = User.find(params[:id])
    if params[:admin] == '1'
      user.add_role(:admin)
    elsif params[:admin] == '0'
      user.remove_role(:admin)
    end

    if params[:manager] == '1'
      user.add_role(:manager)
    elsif params[:manager] == '0'
      user.remove_role(:manager)
    end

    if params[:content_manager] == '1'
      user.add_role(:content_manager)
    elsif params[:content_manager] == '0'
      user.remove_role(:content_manager)
    end
    redirect_to users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_user_session_path
  end

  private def user_params
    params.require(:user).permit(:fullname, :email, :password)
  end
end
