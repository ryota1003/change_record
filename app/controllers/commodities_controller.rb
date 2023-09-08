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
  end
  
  #登録一覧画面
  def show
    @commodities = Commodity.all
  end
end
