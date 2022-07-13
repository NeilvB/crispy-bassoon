require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  test 'user adds a rating' do
    user = User.create!(
      name: 'Person',
      email: 'person@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    Course.create!(name: 'Course 1', users: [user])

    visit root_path

    fill_in('Email', with: 'person@example.com')
    fill_in('Password', with: 'password')
    click_button('Save')

    assert_selector 'h1', text: 'Courses'

    within('#courses') do
      click_link 'Course 1'
    end

    select '4', from: 'My Rating'
    click_button 'Submit my rating'

    within(find('div', text: 'Course 1')) do
      assert_text 'Rating: 4.0'
    end
  end
end
