class DebugController < ApplicationController
  def index
      @posts = current_user.get_posts
  end
end
