class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update]
  before_action :set_item, only: [:edit,:show,:update]
  before_action :redirect_edit, only:[:edit,:update]
  
  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end 
  end


  private
  
  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:state_id,:postage_id,:region_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_edit
     if current_user.id != @item.user.id
        redirect_to root_path
     end
  end
end