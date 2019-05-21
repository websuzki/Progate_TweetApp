class UsersController < ApplicationController
  before_action :check_logged_in, {only: [:index, :show, :update, :edit, :logout]}
  before_action :check_correct_user, {only: [:edit, :update,]}
  
  
  
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
    @user.password = params[:password]
    if params[:image]
      @user.user_image = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.user_image}", image.read)
    end
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
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], user_image: "kitten.jpg")
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}さん、新規登録が完了しました"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end
  
  def login_form
        @user =User.new
  end
  
  def login
    @user =User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name} さん、おかえりなさい"
      redirect_to("/posts/index")
    else
      flash[:notice] = "名前が存在しないか、メールアドレスが間違っています"
      render('/users/login_form')
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    render('login_form')
  end
end
