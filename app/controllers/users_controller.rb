class UsersController < ApplicationController
  #sign up画面
  def index
    @user = User.new
  end
  
  #登録ボタン
  def create
  @user = User.new(name: params[:user][:name], password: params[:user][:password])
  if @user.save
    redirect_to login_path, success: "登録が完了しました"
  else
    flash.now[:danger] = "登録に失敗しました"
    render :index
  end
  end
end
