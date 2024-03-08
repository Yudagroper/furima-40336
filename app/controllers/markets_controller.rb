class MarketsController < ApplicationController
  def index
    @markets = market.all
  end
end
