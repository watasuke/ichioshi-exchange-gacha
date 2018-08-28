class UsersController < ApplicationController
  def collection
    collection = Result.where(user_id: current_user.id)
    @posts = Post.where(id: collection.post_id)
  end

  def posts
    @user = User.find_by(id: current_user.id)
  end
end
