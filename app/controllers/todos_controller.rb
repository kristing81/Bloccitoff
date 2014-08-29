class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end
 
  def create  
    @todo = list.todos.build.(todo_params)
    @todo.list = @list
    if @todo.save
      redirect_to @list, notice: 'Your new Todo was saved'
    else
      flash[:error] = 'There was an error saving your item.  Please try again'
      render :new
    end
  end

  def show
    @list = List.find(params[:list_id])  
    @todo = Todo.find(params[:id])
  end

  def index
    @todos = current_user.todos
    @todo = Todo.new
  end

  def complete?
    true
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :complete)
  end
end