class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @projects = Project.global_search(params[:query])
      @user_favorites = Favorite.where(user_id: current_user)
    elsif params[:query] == "" || (params.keys == ["controller", "action"]) && (params[:controller] == "projects" && params[:action] == "index") || (params[:location] == "" && params[:category] == "" && params[:favorite] == "" && params[:collaborator] == "" && params[:controller] == "projects" && params[:action] == "index")
      @projects = Project.all
      @user_favorites = Favorite.where(user_id: current_user)
    else
      @projects = Project.where(location: params[:location]).or(Project.where(category_id: Category.all.where(name: params[:category]).ids.first))
      @user_favorites = Favorite.where(user_id: current_user)
      if params[:favorite] == "" && params[:collaborator] == ""
        @projects
        @user_favorites = Favorite.where(user_id: current_user)
      elsif params[:favorite] != ""
        Project.all.each do |project|
          @projects = @projects.to_ary
          if project.favorites.count == params[:favorite].to_i
            @projects << project
          end
        end
        @user_favorites = Favorite.where(user_id: current_user)
      elsif params[:collaborator] != ""
        Project.all.each do |project|
          @projects = @projects.to_ary
          if project.bookings.count == params[:collaborator].to_i
            @projects << project
          end
        end
        @user_favorites = Favorite.where(user_id: current_user)
      else
        @user_favorites = Favorite.where(user_id: current_user).order(created_at: :asc)
        @projects = Project.all.order(created_at: :asc)
      end
    end

    @form_projects_locations = Project.all
    @locations = []
    @form_projects_locations.each do |project|
      @locations << project.location
    end

    @categories = []
    Category.all.each do |category|
      @categories << category.name
    end

    @form_projects_favorites = Project.all
    @favorites = []
    @form_projects_favorites.each do |project|
      @favorites << project.favorites.count
    end

    @form_projects_collaborators = Project.all
    @collaborators = []
    @form_projects_collaborators.each do |project|
      @collaborators << project.bookings.where(status: "Approved").count
    end
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
    @project.user_id = current_user.id
    if @project.save
      redirect_to dashboard_path

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
    params.require(:project).permit(:title, :description, :location, :category_id, photos: [])
  end
end
