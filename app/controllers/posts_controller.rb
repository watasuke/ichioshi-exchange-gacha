class PostsController < ApplicationController
  before_action :authenticate, :current_user

  def show
    @post = Post.find_by(slug: params[:slug])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], comment: params[:comment], user_id: current_user.id)
    if @post.save
      user = Credit.find_by(user_id: current_user.id)
      user.credits += 3
      user.save
      flash[:notice] = "イチオシを投稿しました"
      redirect_to("/")
    else
      render("/posts/new")
    end
  end
end
