# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
    flash[:errors] << "Couldn't sign in with given e-mail and password!" unless authenticates && !user.nil?

    redirect_to(sign_in_path) && return
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def delete
    sign_out
    redirect_to(root_path) && return
  end
end
