require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  test "student sees their own courses only" do
    user = User.create!(
      name: 'Person1',
      email: 'person@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    other_user = User.create!(
      name: 'Person2',
      email: 'person@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    Course.create!(name: 'Course 1', users: [user, other_user])
    Course.create!(name: 'Course 2', users: [other_user])

    visit root_path

    fill_in('Email', with: 'person@example.com')
    fill_in('Password', with: 'password')
    click_button('Save')
    
    assert_text 'Courses'

    within('#courses') do
      assert_text 'Course 1'

      refute_text 'Course 2'
    end
  end
end
