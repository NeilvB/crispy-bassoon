require 'test_helper'

class CoursesTest <  ActiveSupport::TestCase
  test 'missing attributes is not valid' do
    course = Course.new

    refute course.save

    assert_includes course.errors.messages[:name], "can't be blank"
  end

  test 'average rating' do
    course = Course.new(name: 'course_name')

    assert_nil course.rating

    course.user_course_ratings.push(
      UserCourseRating.new(
        course: course,
        rating: 4,
        user: User.new(name: 'user_name1'),
      )
    )

    # Can handle rating models without a rating
    course.user_course_ratings.push(
      UserCourseRating.new(
        course: course,
        user: User.new(name: 'user_name2'),
      )
    )
      
    assert_equal course.rating, 4
      
    course.user_course_ratings.push(
      UserCourseRating.new(
        course: course,
        rating: 5,
        user: User.new(name: 'user_name3'),
      )
    )

    assert_equal course.rating, 4.5
    
    course.user_course_ratings.push(
      UserCourseRating.new(
        course: course,
        rating: 5,
        user: User.new(name: 'user_name4'),
      )
    )

    assert_equal course.rating, 4.6
  end
end
