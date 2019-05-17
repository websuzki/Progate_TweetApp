class UsersController < ApplicationController

  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  #編集関係のアクション
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user =User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "登録内容を変更しました"
      redirect_to("/users/#{@user.id}/show")
    else
      render("users/edit")
    end
  end
  
#新規作成関係のアクション
  def new
    @user =User.new
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "新規登録が完了しました"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end
  
  def login_form
        @user =User.new
  end
  
  def login
    @user =User.find_by(name: params[:name], email: params[:email])
    if @user
      @current_user = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "名前が存在しないか、メールアドレスが間違っています"
      render('/users/login_form')
    end
  end
  
  def logout
    @current_user = nil
    redirect_to('/login_form')
  end
end
