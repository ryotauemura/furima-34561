class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index 
  def index 
    @item = Item.find(params[:item_id])
    @buyer_shipping = BuyersShippings.new
  end

  def new
    
  end

  def create
    @item = Item.find(params[:item_id])
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
  
end
