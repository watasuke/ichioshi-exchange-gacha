class PostsController < ApplicationController
  before_action :current_user
  before_action :authenticate, {except: [:show]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def show
    @post = Post.find_by(slug: params[:slug])
    @user = User.find_by(id: @post.user_id)
    # 三項演算子
    @credits = @current_user ? Credit.find_by(user_id: @current_user.id).credits : 0

    wows = Wow.where(post_id: @post.id)
    @wow_users = User.where(id: wows.pluck(:user_id))

    agreements = Agreement.where(post_id: @post.id)
    @agreement_users = User.where(id: agreements.pluck(:user_id))
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], comment: params[:comment], user_id: current_user.id, wows_count: 0, agreements_count: 0)
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
    @post.title = params[:title]
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
