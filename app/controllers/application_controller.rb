 # frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # Catch CanCan:AccessDenied exception
  rescue_from CanCan::AccessDenied do |_exception|
    render file:
      Rails.root.join('public', '403.html'), status: 403, layout: false
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :name])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[attribute fullname])
  end
end
