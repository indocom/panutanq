# frozen_string_literal: true

class UsersController < ApplicationController
<<<<<<< HEAD
  #	before_action :authorize_admin, only: :create
=======
  def index
    @users = User.all
    authorize! :read, @users
  end

  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end
>>>>>>> 3e1560984d97aceb666b0622e451686f8a6543ea

  def new
    @user = User.new
    authorize! :create, @user, message: 'You are not authorized to create new account'
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
    authorize! :edit, @user
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
    authorize! :delete, User
    User.find(params[:id]).destroy
    redirect_to new_user_session_path
  end

  private def user_params
    params.require(:user).permit(:fullname, :email, :password)
  end
end
