class ProjectsController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user)
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @current_day = Time.now.day
    @current_month = Time.now.month
    @current_year = Time.now.year
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user
    if @project.save
      redirect_to dashboard_path
      raise
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project = Project.update(project_params)
    if @project.save
      redirect_to #####project_show#####
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :location, :category_id)
  end
end
