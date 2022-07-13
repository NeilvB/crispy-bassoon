class UserCourseRating < ApplicationRecord
  belongs_to :course
  belongs_to :user

  ALLOWED_RATINGS = (1..5).to_a
end
