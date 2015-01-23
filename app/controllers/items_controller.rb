class ItemsController < ApplicationController

  def index
    @item = current_user.item.all
  end


  def create
    @list = List.find(params[:list_id])
    @item = current_user.items.build(item_params)
    @item.list = @list
    @new_item = Item.new

    if @item.save
      flash[:notice]= "Item was saved."
      redirect_to @list
    else
      flash[:error] = "Error saving item. Please try again."
      redirect_to @list
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was completed"
      redirect_to @list
    else
      flash[:error] = "Item could not be completed successufully. Please try again."
      redirect_to @list
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :duedate)
  end
end