class MarketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
<<<<<<< Updated upstream
=======
  before_action :set_market, only: [:show, :edit, :update, :destroy]
>>>>>>> Stashed changes

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

  #def edit
    #if @market.user_id == current_user.id && @market.buy.nil?
    #else
    #  redirect_to root_path
    #end
  #end

  def show
    @market = Market.find(params[:id])
  end

  def destroy
    if @market.user_id == current_user.id
      @market.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def market_params
    params.require(:market).permit(:image, :goods, :explan, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  #def set_market
  #  @market = Market.find(params[:id])
  #end
end

