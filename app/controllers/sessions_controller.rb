# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
  def create
    user = User.find_by email: params[:email]
    password = params[:password]
    authenticates = user.authenticate(password)
    if authenticates
      sign_in user
      redirect_to(root_path) && return
    end

    flash[:errors] = []
    flash[:errors] << 'E-mail must not be empty.' if params[:email].empty?
    flash[:errors] << 'Password must not be empty.' if params[:password].empty?
    unless authenticates
      flash[:errors] << "Couldn't sign in with given e-mail and password!" unless user.nil?
    end

    redirect_to(sign_in_path) && return
  end
  # rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity

  def delete
    sign_out
    redirect_to root_path
  end
end
