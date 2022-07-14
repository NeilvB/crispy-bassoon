class Course < ApplicationRecord
  validates :name, presence: true

  has_many :user_course_ratings
  has_many :users, through: :user_course_ratings

  def rating
    return if user_course_ratings.length == 0

    all_ratings = user_course_ratings.map(&:rating).compact

    (all_ratings.sum / all_ratings.count.to_f).floor(1)
  end
end
