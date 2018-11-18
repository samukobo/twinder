class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  def is_following target_id
    if Relationship.find_by follower_id: self[:id], followed_id: target_id 
      return true
    else
      return false
    end
  end

  def get_posts
    active_following = Relationship.where(follower_id: self[:id])
    ids = [self[:id]]
    active_following.each do |relation|
      ids.push relation.followed_id 
    end
    posts = Post.where user_id: ids
    return posts.reverse
  end

  def get_followers
    active_rels = Relationship.where(followed_id: self[:id])
    return active_rels.count
  end

  def get_following
    active_rels = Relationship.where(follower_id: self[:id])
    return active_rels.count
  end
end
