class ListsController < ApplicationController
  respond_to :html, :js

  def create
    @list = current_user.list.build(list_params) #Wouldn't need authorize if i have current user create it?
    authorize @list
    if @list.save
      flash[:notice] = "List was saved"
      redirect_to @list
    else
      flash[:error] = "There was an error saving the To-do List. Please try again."
      render :new
    end
  end

  def index
    if current_user
      @lists = current_user.list.all #is this the correct way to dispaly all ?
    else
      flash[:error] = "Make sure you are signed in and create a new list"
      redirect_to root_path
    end
  end

  def show
    @list = List.find(params[:id])
    authorize @list
    @items = @list.items
    # @item = Item.new
  end

  def new
    @list = List.new
    authorize @list
  end


  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "Error updating List, Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      flash[:notice] = "Your list was deleted successfully."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list."
      redirect_to @list
    end
  end

private

  def list_params
    params.require(:list).permit(:title)
  end
end
