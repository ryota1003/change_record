class CommoditiesController < ApplicationController
  #Signin Login画面
  def index
  end
  
  #登録画面
  def new
    @commodity = Commodity.new
  end
  
  #登録ボタン
  def create
     @commodity = Commodity.new(commodity_params)

    if @commodity.save!
      redirect_to commodities_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  #登録一覧画面
  def show
    @commodities = Commodity.all
  end
  
  private
  def commodity_params
    params.require(:commodity).permit(:registration_name, :change_interval).merge(user_id: current_user_id)
  end
end
