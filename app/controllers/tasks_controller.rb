class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "successfully added new task: #{task.name}"
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "successfully updated the task: #{task.name}"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "successfully deleted the task: #{task.name}"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
