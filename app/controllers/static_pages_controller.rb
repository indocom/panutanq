# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def dashboard
    @users = User.all
  end
end
