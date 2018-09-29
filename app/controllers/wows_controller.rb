class WowsController < ApplicationController
  before_action :set_post

  def create
    @wow = Wow.create(user_id: current_user.id, slug: params[:slug])
    @wows = Wow.where(slug: params[:slug])
    @post.reload
  end

  def destroy
    wow = Wow.find_by(user_id: current_user.id, slug: params[:slug])
    wow.destroy
    @wows = Wow.where(slug: params[:slug])
    @post.reload
  end

  private

  def set_post
    @post = Post.find(slug: params[:slug])
  end
end
