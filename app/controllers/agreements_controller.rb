class AgreementsController < ApplicationController
  before_action :set_post

  def create
    @agreement = Agreement.create(user_id: current_user.id, post_id: @post.id)
    @agreements = Agreement.where(post_id: @post.id)
    @post.reload
  end

  def destroy
    agreement = Agreement.find_by(user_id: current_user.id, post_id: @post.id)
    agreement.destroy
    @agreements = Agreement.where(post_id: @post.id)
    @post.reload
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
