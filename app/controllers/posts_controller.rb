class PostsController < ApplicationController
  before_action :authenticate
  def show
    user = current_user
    if user.credits == 0
      flash[:notice] = "ガチャを引くためのクレジットが不足しています。イチオシを投稿してクレジットを貯めてください"
      redirect_to("/")
    else
      @post = Post.offset( rand(Post.count) ).first
      user.credits -= 1
      user.save
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], comment: params[:comment], user_id: current_user.id)
    if @post.save
      user = current_user
      user.credits += 5
      user.save
      flash[:notice] = "イチオシを投稿しました"
      redirect_to("/")
    else
      render("/posts/new")
    end
  end
end
