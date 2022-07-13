class UserCourseRatingsController < ApplicationController
  before_action :assign_user_course_rating, only: [:update]
  before_action :assign_course, only: [:update]

  def update
    if @user_course_rating&.update(rating: user_course_rating_params[:rating])
      redirect_to course_path(@course), notice: 'Course updated'
    else
      render edit_course_path(@course)
    end
  end

  private

  def user_course_rating_params
    params.require(:user_course_rating).permit(:rating)
  end

  def assign_user_course_rating
    @user_course_rating = @current_user.user_course_ratings.find(params[:id])
  end

  def assign_course
    @course = @user_course_rating.course
  end
end
