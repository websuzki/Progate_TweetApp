class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
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
  
  def new
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email])
    @user.save
    redirect_to("/users/index")
  end
end
