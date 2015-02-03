class ItemsController < ApplicationController
  respond_to :html, :js

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

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      flash[:notice]= "Item was updated"
      redirect_to @list
    else
      flash[:error] = "Error updating item.  Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    authorize @item

    if @item.destroy
      flash[:notice] = "Item was completed"
    else
      flash[:error] = "Item could not be completed successufully. Please try again."
    end
      respond_with(@item) do |format|
        format.html { redirect_to @list }
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :duedate)
  end
end