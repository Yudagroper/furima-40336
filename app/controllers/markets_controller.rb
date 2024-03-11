class MarketsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
  end

end
