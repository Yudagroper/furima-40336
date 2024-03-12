class MarketsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(item_params)
    if @market.save
      redirect_to root_path
    else
      render :new
    end
  end
end

