class UsersController < ApplicationController
  #sign up画面
  def index
    @user = User.new
  end
  
  #登録ボタン
  def create
  @user = User.new(name: params[:user][:name], password: params[:user][:password])
  if @user.save
    redirect_to root_path
  else
    render :index
  end
  end
end
