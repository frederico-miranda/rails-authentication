class UsersController < ApplicationController
  def new
  end

  def create
   user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
   if user
     self.current_user = user
     redirect_to root_path
   else
     # TODO: error when creating user.
   end
  end
end
