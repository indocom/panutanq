# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Catch CanCan:AccessDenied exception
  rescue_from CanCan::AccessDenied do |_exception|
    render file:
      Rails.root.join('public', '403.html'), status: 403, layout: false
  end
end
