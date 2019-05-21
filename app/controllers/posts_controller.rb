class PostsController < ApplicationController
  before_action :check_logged_in, {only: [:index, :show, :new, :create, :edit, :update, :destroy]}
  before_action :check_correct_post_owner, {only: [:edit, :update, :destroy]}
  
  def check_correct_post_owner
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/index")
    end
  end
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:new_content], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "新規投稿を追加しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:edited_content]
    if @post.save
      flash[:notice] = "投稿を更新しました"
      redirect_to("/posts/index") 
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
