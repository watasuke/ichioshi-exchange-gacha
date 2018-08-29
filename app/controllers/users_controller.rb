class UsersController < ApplicationController
  def collection
    results = Result.where(user_id: current_user.id)
    collection_ids = []

    # idだけ集める
    results.each do |result|
      collection_ids << result.post_id
    end

    # 集めたidで引く
    @collections = Post.where(id: collection_ids)
  end

  def posts
    @user = User.find_by(id: current_user.id)
  end
end
