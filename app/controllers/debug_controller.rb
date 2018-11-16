class DebugController < ApplicationController
  def index
      @posts = Post.all
  end
end
