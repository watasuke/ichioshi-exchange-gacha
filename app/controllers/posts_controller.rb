class PostsController < ApplicationController
  before_action :current_user, :authenticate
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

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
      redirect_to("/posts/#{@post.slug}")
    else
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(slug: params[:slug])
  end

  def update
    @post = Post.find_by(slug: params[:slug])
    @post.comment = params[:comment]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/#{@post.slug}")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(slug: params[:slug])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/")
  end

  def ensure_correct_user # 正しいユーザーか(編集権限がある本人か)を確かめる
    @post = Post.find_by(slug: params[:slug])
    if @post.user_id.to_i != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
