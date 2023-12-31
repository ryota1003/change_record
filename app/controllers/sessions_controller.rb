class SessionsController < ApplicationController
  #ログイン画面
  def new
  end
  
  #ログイン画面のログインボタンをおすとここが動く
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to new_commodity_path, success:  "ログインに成功しました"
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
   def name_params
     params.require(:session).permit(:name)
   end
   
   def password_params
     params.require(:session).permit(:password)
   end
   
   def log_in(user)
     session[:user_id] = user.id
   end
   
   def log_out
     session.delete(:user_id)
     @current_user = nil
   end
end
