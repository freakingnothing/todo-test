class V1::ProjectsController < ApplicationController
  respond_to :json

  def index
    @projects = Project.all
    # respond_with :v1, @projects
    render json: @projects, include: ["tasks.**"]
  end

  def show
    @project = Project.find(params[:id])
    render json: @project, include: ["tasks.**"]
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      @project.tag_list=(params[:tag_list]) if params[:tag_list]
      render json: @project, status: :created
    else
      head(:unprocessable_entity)
    end

    # respond_with :v1, @project
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      @project.tag_list += @project.tag_list=(params[:tag_list]) if params[:tag_list]
      render json: @project
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.destroy
      head(:ok)
    else
      head(:error)
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, tag_list: [])
  end
end
