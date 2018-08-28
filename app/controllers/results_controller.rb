class ResultsController < ApplicationController
  def create
    user = Credit.find_by(user_id: current_user.id)
    if user.credits == 0
      flash[:notice] = "ガチャを引くためのクレジットが不足しています。イチオシを投稿してクレジットを貯めてください"
      redirect_to("/")
    else
      post = Post.offset( rand(Post.count) ).first
      user.credits -= 1
      user.save

      Result.create(user_id: current_user.id, post_id: post.id)

      redirect_to :controller => 'posts', :action => 'show', :slug => post.slug
    end
  end
end
