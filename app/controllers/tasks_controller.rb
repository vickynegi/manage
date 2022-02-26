class TasksController < ApplicationController

  before_action :set_task, only: [:destroy]
  ## list all the tasks
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    respond_to :js
  end

  ## create an object
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.html { render :index }
      end
    end
  end

  ## delete an object
  def destroy
    @task.destroy
    redirect_to action: "index"
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:position, :title, :is_done)
  end
end
