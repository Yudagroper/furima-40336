class ReceiptsController < ApplicationController
  #before_action :authenticate_user!
  #before_action :non_purchased_market, only: [:index, :create]

  #def index

  #end

  #def create
  #@market = Market.find(params[:market_id])
  #@recepit = @market.recepits.new(recepit_params)
  #@recepit.save
  #end

  #private
  #def recepit_params
  #  params.require(:recepit).permit(:content).merge(user_id: current_user.id)
  #end
end
