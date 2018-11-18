class UsersController < ApplicationController
  def show
    @user = User.find params[:user_id]
    @posts = Post.where user_id: params[:user_id]
    @posts = @posts.reverse
  end

  def follow
    user = User.find params[:user_id]
    user.active_relationships.create(followed_id: params[:target_id])

    redirect_to users_show_path user_id: params[:target_id]
  end

  def unfollow
    relation = Relationship.find_by(follower_id: params[:user_id], followed_id: params[:target_id])
    relation.destroy

    redirect_to users_show_path user_id: params[:target_id]
  end

end
