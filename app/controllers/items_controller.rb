class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @items = @list.items

    @item = @list.items.build(item_params)
    @item.list = @list

    if @item.save
      flash[:notice]= "Item was saved."
      redirect_to @list
    else
      flash[:error] = "Error saving item. Please try again."
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
