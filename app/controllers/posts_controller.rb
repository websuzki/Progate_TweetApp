class PostsController < ApplicationController
  def index
    @posts = Post.all    
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:new_content])
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
    redirect_to("/posts/index")
  end
end
