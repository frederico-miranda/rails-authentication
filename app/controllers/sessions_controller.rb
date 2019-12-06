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
    # TODO: unsuccessful sign in attempt
    redirect_to(sign_in_path) and return
   end
  end

  def delete
    sign_out
    redirect_to root_path
  end
end
