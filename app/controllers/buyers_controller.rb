class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index 
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.create(buyer_params)
    Shipping.create(shipping_params)
    redirect_to root_path
  end

  private

  def buyer_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def shipping_params
    params.permit(:postal_code,:region_id,:municipality,:address,:building,:phone_number).merge(buyer_id: @buyer.id)
  end
end
