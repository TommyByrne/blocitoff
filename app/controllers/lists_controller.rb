class ListsController < ApplicationController
 before_action :authenticate_user!

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List was saved"
      redirect_to @list
    else
      flash[:error] = "There was an error saving the To-do List. Please try again."
      render :new
    end
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
