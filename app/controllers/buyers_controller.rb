class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index] 
  before_action :set_item, only:[:index,:create]
  before_action :redirect_buyer, only:[:index]

  def index 
    @buyer_shipping = BuyersShippings.new
  end

  def new

  end

  def create
    @buyer_shipping = BuyersShippings.new(buyer_params)
    if @buyer_shipping.valid?
      pay_item
      @buyer_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyers_shippings).permit(:postal_code, :region_id, :municipality, :address, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_buyer
      if current_user.id == @item.user.id || @item.buyer.present?
       redirect_to root_path
      end
  end
  
end
