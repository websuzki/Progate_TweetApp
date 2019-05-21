class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  
  
  def set_current_user
      @current_user = User.find_by(id: session[:user_id])
  end
  
  def check_logged_in
    if session[:user_id] == nil
        flash[:notice] = "ログインしないとアクセスできません"
        redirect_to("/login_form")
    end
  end
  
  def check_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/index")
    end
  end
end
