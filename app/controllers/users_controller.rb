class UsersController < ApplicationController
  def collection
    results = Result.where(user_id: current_user.id)
    @collections = Post.where(id: results.pluck(:post_id))
  end

  def posts
    @user = User.find_by(id: current_user.id)
  end
end
