class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end
end

private
def item_params
  params.require(:item).paermit(:name,:description,:category,:state,:postage,:region,:shipping,:price)
end