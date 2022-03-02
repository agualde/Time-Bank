class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @project = Project.find(params[:project_id])
    @favorite.project_id = @project.id
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to projects_path


  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to projects_path
  end
end
