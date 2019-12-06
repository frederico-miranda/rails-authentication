class ApplicationController < ActionController::Base

  def current_user
    remember_token = cookies.permanent[:remember_token]
    if remember_token
      @user ||= User.find_by(remember_token: remember_token)
    end
  end

  def current_user=(user)
    cookies.delete :remember_token if user.nil?
    cookies.permanent[:remember_token] = user.remember_token unless user.nil?
    @user = user
  end

  def sign_in(user)
    user.remember_token = User.new_remember_token
    if user.save
      self.current_user = user
      redirect_to root_path
    else
      # TODO: 500 - internal server error
    end
  end

  def sign_out
    self.current_user = nil
  end
end
