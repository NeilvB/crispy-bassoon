class User < ApplicationRecord
  has_secure_password

  has_many :user_course_ratings
  has_many :courses, through: :user_course_ratings
end
