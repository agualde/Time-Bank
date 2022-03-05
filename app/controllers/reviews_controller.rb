class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.find(params[:id])

    @my_projects_together = Booking.where(user_id: params[:id])
    @her_projects_together = Booking.where(user_id: current_user.id, status: "Approved")

    @our_projects = []

    @my_projects_together.each do |booking|
      @our_projects << booking.project.title
    end

    @her_projects_together.each do |booking|
      @our_projects << booking.project.title
    end

  end

  def create
    @review = Review.new(review_params_no_userid)
    @review.rating = params[:review][:rating].to_i
    @review.user_id = current_user.id
    if @review.save
      UserReview.create(user_id: review_params_userid.value, review_id: @review.id)
      redirect_to user_registration_path(review_params_userid.value)
    else
      render :new
    end
    raise
  end

  def destroy
    @user = User.find(current_user)
    @user.destroy

    redirect_to user_registration_path(review_params_userid.value)
  end

  private

  def review_params_no_userid
    params.require(:review).permit(:title, :content, :project)
  end

  def review_params_userid
    params.require(:review).permit(:user_id)
  end

end
