class WowsController < ApplicationController
  before_action :set_post

  def create
    @wow = Wow.create(user_id: current_user.id, post_id: @post.id)
    @wows = Wow.where(post_id: @post.id)
    @post.reload
  end

  def destroy
    wow = Wow.find_by(user_id: current_user.id, post_id: @post.id)
    wow.destroy
    @wows = Wow.where(post_id: @post.id)
    @post.reload
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
