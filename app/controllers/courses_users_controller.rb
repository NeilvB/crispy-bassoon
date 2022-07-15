class CoursesUsersController < ApplicationController
  def update
    course_user = @current_user
        .courses_users.find(params[:id])
      
    if course_user&.update!(rating: courses_user_params[:rating])
      redirect_to courses_url
    else
      render 'courses#show'
    end
  end

  private

  def courses_user_params
    params.require(:courses_user).permit(:rating)
  end
end
