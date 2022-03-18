class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @project = Project.find(params[:project_id])
    @favorite.project_id = @project.id
    @favorite.user_id = current_user.id
    @favorite.save
    @user_favorites = Favorite.where(user_id: current_user)
    # redirect_to projects_path(anchor: @project.id)
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/favouriteDelete', locals: { project: @project, user_favorites: @user_favorites }, formats: [:html] }
    end
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
    # raise
    @project = @favorite.project 
    @user_favorites = Favorite.where(user_id: current_user)
    @favorite.destroy
    # redirect_to projects_path

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/favouriteCreate', locals: { project: @project, user_favorites: @user_favorites }, formats: [:html] }
    end
  end

  def destroyfavorite
    @favorite = Favorite.find(params[:id])
    @project = @favorite.project_id
    @favorite.destroy

    redirect_to project_path(@project)
  end


end
