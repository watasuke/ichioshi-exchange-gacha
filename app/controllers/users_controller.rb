class UsersController < ApplicationController
  def collection
    @collections = Result.where(user_id: current_user.id)
  end

  def posts
    @user = User.find_by(id: current_user.id)
  end
end
