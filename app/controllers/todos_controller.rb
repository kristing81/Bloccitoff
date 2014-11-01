class TodosController < ApplicationController
  respond_to :html, :js

  def new
    @list = List.find(params[:list_id])
    @todo = @list.todos.new
  end
 
  def create
    @list = List.find(params[:list_id])  
    @todo = list.todos.create(todo_params)

    if @todo.save
      flash[:notice] = 'Your new Todo was saved'
      redirect_to list_todo_path(@list)
    else
      flash[:error] = 'There was an error saving your item.  Please try again'
      render :new
    end
  end

  def index
    @todos = list.todos
  end

  def show
    @todo = list.todos.find(params[:id])
  end

  def edit
    @todo = list.todos.find(params[:id])
  end
  def update
    @todo = list.todos.find(params[:id])

    if @todo.update_attributes(todo_params)
      flash[:notice] = "Todo was updated successfully."
      redirect_to @list
    else
      flash[:error] = "Error updating . Please try again."
    end
  end

  def complete
     @todo = list.todos.find(params[:id])
     @todo.update_attributes(params[:complete])
     #@todo.update(["completed_at=?", Time.now], :id => params[:todo_id])
     @todo.delete
     redirect_to [@list], notice: 'Todo is complete'
    end
  def destroy
    @todo = list.todos.find(params[:id])
      if @todo.destroy
      flash[:notice] = "Todo was deleted successfully."
      redirect_to @list
      else
      flash[:error] = "There was an error deleting the todo."
      end
  end
    
  private

  def todo_params
    params.require(:todo).permit(:description, :complete, :list_id)
  end

  def list
    @list = List.find(params[:list_id]) 
  end
end