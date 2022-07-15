class Course < ActiveRecord::Base
  has_many :courses_users
  has_many :users, through: :courses_users

  def rating
    ratings = courses_users.map(&:rating).compact

    return if ratings.length == 0

    ratings.sum / ratings.length.to_f
  end
end
