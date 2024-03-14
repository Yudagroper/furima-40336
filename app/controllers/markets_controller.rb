class MarketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_market, only: [:show, :edit, :update]

  def index
    @markets = Market.all.order(created_at: :desc)
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @market.user_id == current_user.id
    else
      redirect_to root_path
    end
  end
  
  def update
    @market.update(market_params)
    if @market.valid?
      redirect_to market_path(market_params)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def market_params
    params.require(:market).permit(:image, :goods, :explan, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_market
    @market = Market.find(params[:id])
  end
end

