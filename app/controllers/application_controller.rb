# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    remember_token = cookies.permanent[:remember_token]
    @user ||= User.find_by(remember_token: remember_token) if remember_token
    @user
  end

  def current_user=(user)
    cookies.delete :remember_token if user.nil?
    cookies.permanent[:remember_token] = user.remember_token unless user.nil?
    @user = user
  end

  def sign_in(user)
    user.remember_token = User.new_remember_token
    return unless user.save

    self.current_user = user
    redirect_to(root_path) && return
  end

  def sign_out
    self.current_user = nil
  end
end
