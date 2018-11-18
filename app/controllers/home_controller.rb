class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = current_user.get_posts
    end
  end

  def all 
    @posts = Post.all
    @posts = @posts.reverse
  end

  def create_tweet
    current_user.posts.create body: params[:body]
    redirect_to params[:targ_path]
  end
end
