# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      self.current_user = user
      redirect_to root_path
    else
      flash[:errors] = []
      user.errors.full_messages.each do |error|
        flash[:errors] << error
      end
      redirect_to(new_user_path) && return
    end
  end
end
