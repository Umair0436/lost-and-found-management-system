class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
    @items = Item.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

 def edit

    @item = Item.find(params[:id])

    if @item.user_id != current_user.id

      redirect_to items_path, alert: "You are not the owner of this item."

    end

  end

  def update
    @item = Item.find(params[:id])
    if @current_user != @item.user
      redirect_to items_path, alert: "You are not the owner of this item."
    end
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit  
      end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to items_path, alert: "You are not the owner of this item."
    end
    @item.destroy
    redirect_to items_path
  end   

  private

  def item_params
    params.require(:item).permit(:name, :description, :location, :status)
  end

end