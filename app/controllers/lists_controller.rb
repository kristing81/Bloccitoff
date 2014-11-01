class ListsController < ApplicationController
  respond_to :html, :js
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'Your list was saved'
    else
      flash[:error] = 'There was an error saving your list.  Please try again'
      render :new 
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to @list
    else
      render action: 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
    flash[:notice] = "List was deleted successfully."
    else
    flash[:error] = "There was an error deleting the list."
    end
    respond_with(@list) do |format|
    format.html { redirect_to lists_path }
    end 
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
