class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_market, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @receipt_form = ReceiptForm.new
  end

  def create
    @receipt_form = ReceiptForm.new(receipt_params)
    if @receipt_form.valid?
      pay_market
      @receipt_form.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def receipt_params
    params.require(:receipt_form).permit(:postcode, :prefecture_id, :municipalities, :street_address, :building, :telephone_number).merge(user_id: current_user.id, market_id: params[:market_id], token: params[:token])
  end

  def pay_market
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @market.price,
      card: receipt_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_market
    @market = Market.find(params[:market_id])
    redirect_to root_path if current_user.id == @market.user_id || @market.receipt.present?
  end
end