class PostsController < ApplicationController
  def index
  end

  def new
   user = self.current_user
   unless user
     flash[:errors] = []
     flash[:errors] << "You need to be signed in to publish a new post."
     redirect_to(sign_in_path) and return
   end
  end

  def create
    user = self.current_user
    post = Post.new(user: user, content: params[:post][:content])
    if post.save
      redirect_to(posts_path) and return
    else
      flash[:errors] = []
      post.errors.full_messages.each do |error|
        flash[:errors] << error
      end
      redirect_to(new_post_path) and return
    end
  end
end
