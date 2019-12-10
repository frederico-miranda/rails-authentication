# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end

  def current_user=(user)
    @user = user
  end

  def sign_in(user)
    user.remember_token = User.new_remember_token
    return unless user.save
    cookies.permanent[:remember_token] = user.remember_token
    @user = user
  end

  def sign_out
    cookies.delete :remember_token
    @user = nil
  end
end
