require "application_system_test_case"

class UserTest < ApplicationSystemTestCase
  test 'signout' do
    user = User.create(
      name: 'Person',
      email: 'person@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    visit root_path

    fill_in('Email', with: 'person@example.com')
    fill_in('Password', with: 'password')
    click_button('Save')

    assert_text 'Courses'

    click_button 'Sign out'
  end
end
