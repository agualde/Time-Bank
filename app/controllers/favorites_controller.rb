class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @project = Project.find(params[:project_id])
    @favorite.project_id = @project.id
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to projects_path(anchor: @project.id)
  end

  def createfavorite
    @favorite = Favorite.new
    @project = Project.find(params[:project_id])
    @favorite.project_id = @project.id
    @favorite.user_id = current_user.id
    @favorite.save

    redirect_to project_path(@project.id)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to projects_path
  end

  def destroyfavorite
    @favorite = Favorite.find(params[:id])
    @project = @favorite.project_id
    @favorite.destroy

    redirect_to project_path(@project)
  end


end
