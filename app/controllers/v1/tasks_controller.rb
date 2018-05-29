class V1::TasksController < ApplicationController
  before_action :find_taskable

  def index
    @tasks = @taskable.tasks.all
    render json: @tasks, include: ["tasks.**"]
  end

  def show
    @task = @taskable.tasks.find(params[:id])
    render json: @task, include: ["tasks.**"]
  end

  def create
    @task = @taskable.tasks.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      head(:error)
    end
  end

  def update
    @task = @taskable.tasks.find(params[:id])
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      head(:error)
    end
  end

  def destroy
    @task = @taskable.tasks.find(params[:id])
    if @task.destroy
      head(:ok)
    else
      head(:error)
    end
  end

  private

  def task_params
    params.require(:task).permit(:body)
  end

  def find_taskable
    @taskable = Task.find(params[:task_id]) if params[:task_id]
    @taskable = Project.find(params[:project_id]) if params[:project_id]
  end
end
