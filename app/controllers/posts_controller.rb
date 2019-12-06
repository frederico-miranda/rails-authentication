class PostsController < ApplicationController
  def index
  end

  def new
   user = self.current_user
   unless user
     flash[:error] = "You need to be signed in to publish a new post."
     redirect_to(sign_in_path) and return
   end
  end

  def create
    user = self.current_user
    post = Post.new(user: user, content: params[:post][:content])
    if post.save
      redirect_to posts_path
      return
    else
      # TODO: needs log in to create post.
    end
  end
end
