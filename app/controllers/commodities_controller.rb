class CommoditiesController < ApplicationController
  #登録一覧画面
  def index
    @commodities = Commodity.all
  end
  
  #登録画面
  def new
    @commodity = Commodity.new
  end
  
  #登録画面の登録ボタン
  def create
     @commodity = Commodity.new(commodity_params)
    # last_changed_dayをdbにつくってあげてlast_changed_day + change_interval でnext_change_dayを作ってあげる。
     @commodity.last_changed_day = Date.today.strftime("%Y/%m/%d")
    if @commodity.save!
      redirect_to commodities_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def show
    #current_user かくならここ
  end
  
  def destroy
    @commodity = Commodity.find(params[:id])
    if @commodity.destroy
     redirect_to commodities_path, success: "削除しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render :index
    end
  end
  
  def edit
    @commodity = Commodity.find(params[:id])
  end
  
  #edit画面の完了ボタン
  def update
    @commodity = Commodity.find(params[:id])
    if @commodity.update(post_params)
      #rootエラーがでる。なぜか。
      redirect_to commodities_path, success: '編集に成功しました'
    else
      flash.now[:danger] = "編集に失敗しました"
      render :index
    end
  end
  
  private
  def commodity_params
    params.require(:commodity).permit(:registration_name, :change_interval).merge(user_id: current_user_id)
  end
end
