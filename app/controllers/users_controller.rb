# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def edit_personal_info
    @user = User.find(params[:id])
  end

  def edit_role
    @user = User.find(params[:id])
  end

  def update_personal_info
    user = User.find(params[:id])
    if user.update(user_info_params)
      redirect_to dashboard_path
    else
      render :edit_personal_info
    end
  end

  def update_role
    user = User.find(params[:id])
    change_role(user, :event_manager)
    redirect_to users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_user_session_path
  end

  private def user_params
    params.require(:user).permit(:fullname, :email, :password)
  end

  private def user_info_params
    params.require(:user).permit(
      :fullname, :contact_number, :major, :graduation, :overseas_experience,
      :work_experience, :display_contact_number, :display_major,
      :display_graduation, :display_overseas_experience,
      :display_work_experience
    )
  end

  private def change_role(user, role)
    if params[role] == '1'
      user.add_role(role)
    elsif params[role] == '0'
      user.remove_role(role)
    end
  end
end
