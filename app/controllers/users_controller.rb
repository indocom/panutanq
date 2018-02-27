# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource

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
    %i[admin manager content_manager].each do |role|
      checkbox_for(user, role)
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

  private def checkbox_for(user, role)
    if params[role] == '1'
      user.add_role(role)
    elsif params[role] == '0'
      user.remove_role(role)
    end
  end
end
