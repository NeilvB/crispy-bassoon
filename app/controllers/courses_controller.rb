class CoursesController < ApplicationController
  def index
    @courses = @current_user.courses
  end

  def edit
    @course = Course.find(params[:id])

    @course_user = @course.courses_users
      .find_or_initialize_by(user: @current_user)
  end
end
