class Post < ApplicationRecord
  belongs_to :author, class_name: "User", optional: true, foreign_key: 'user_id'
end
