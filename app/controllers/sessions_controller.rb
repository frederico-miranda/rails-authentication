class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by email: params[:email]
   password = params[:password]
   if user && user.authenticate(password)
    sign_in user
    # TODO: redirect user to somewhere
   else
    flash[:errors] = []
    flash[:errors] << "E-mail must not be empty." if params[:email].empty?
    flash[:errors] << "Password must not be empty." if params[:password].empty?
    if user.nil? || !user.authenticate(params[:password])
      flash[:errors] << "Couldn't sign in with given e-mail and password!"
    end

    redirect_to(sign_in_path) and return
   end
  end

  def delete
    sign_out
    redirect_to root_path
  end
end
