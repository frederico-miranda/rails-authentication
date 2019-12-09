# frozen_string_literal: true

class PostsController < ApplicationController
  def index; end

  def new
    user = current_user
    return unless user

    flash[:errors] = []
    flash[:errors] << 'You need to be signed in to publish a new post.'
    redirect_to(sign_in_path) && return
  end

  def create
    user = current_user
    post = Post.new(user: user, content: params[:post][:content])
    if post.save
      redirect_to(posts_path) && return
    else
      flash[:errors] = []
      post.errors.full_messages.each do |error|
        flash[:errors] << error
      end
      redirect_to(new_post_path) && return
    end
  end
end
