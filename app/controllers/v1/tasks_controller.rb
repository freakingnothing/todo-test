class V1::TasksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    if @task.save

    else

    end
  end

  def update

  end

  def destroy
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:task_id])
    if @task.destroy

    else

    end
  end

  private

  def task_params
    params.require(:task).permit(:body)
  end
end
