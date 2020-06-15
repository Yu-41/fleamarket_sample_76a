class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC').limit(8)
  end
  
  def new
    @item = Item.new
    @image = Image.new
    @item.images.new
  end

  def show
  end

  def top
    @items = Item.includes(:images).order('created_at DESC').limit(4)
    @items_category = Item.where(category_id: [1...200]).includes(:images).order('created_at DESC').limit(3)
  end
end
