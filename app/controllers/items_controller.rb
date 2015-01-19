class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list
    @new_item = Item.new

    # @items = @list.items
    # @item = @list.items.build(item_params)

    if @item.save
      flash[:notice]= "Item was saved."
    else
      flash[:error] = "Error saving item. Please try again."
    end
      respond_with(@item) do |format|
        format.html { redirect_to []}
      end
  end

    def destroy
      @list = List.find(params[:list_id])
      @item = Item.find(params[:id])

      if @item.destroy
        flash[:notice] = "Item was completed"
      else
        flash[:error] = "Item could not be completed successufully. Please try again."
      end
        respond_with(@item) do |format|
          format.html { redirect_to [@lists, @list_id]}
        end
    end



  private

  def item_params
    params.require(:item).permit(:name, :duedate)
  end
end
