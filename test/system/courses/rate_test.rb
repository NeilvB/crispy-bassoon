require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(
      name: 'Person1',
      email: 'person1@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    another_user = User.create!(
      name: 'Person2',
      email: 'person2@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    Course.create!(
      name: 'Course 1', 
      users: [@user]
    ).tap do |course| 
      course.user_course_ratings.create!(
        user: another_user,
        rating: 5
      )
    end
  end

  test 'user adds a rating' do
    visit root_path

    fill_in('Email', with: 'person1@example.com')
    fill_in('Password', with: 'password')
    click_button('Save')

    assert_selector 'h1', text: 'Courses'

    within('#courses') do
      click_link 'Course 1'
    end

    select '4', from: 'My Rating'
    click_button 'Submit my rating'

    within(find('div', text: 'Course 1')) do
      assert_text 'Rating: 4.5'
    end
  end
end
