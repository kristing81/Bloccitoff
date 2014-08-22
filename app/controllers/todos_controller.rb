class TodosController < ApplicationController

  def new  
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'Your new TODO was saved'
    else
      flash[:error] = 'There was an error saving your item.  Please try again'
      render :new
    end
  end

  def show
    @todo = Todo.find params[:id]
  end

  def index
    @todos = Todo.all
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end