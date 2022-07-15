require 'rails_helper'

RSpec.describe "Courses", type: :system do
  before(:each) { 
    user1 = User.create!(
      email: 'person1@example.com',
      password: 'password',
      password_confirmation: 'password',
    )

    user2 = User.create!(
      email: 'person2@example.com',
      password: 'password',
      password_confirmation: 'password',
    )

    course1 = Course.create!(name: 'Course 1', users: [user1])
    course2 = Course.create!(name: 'Course 2', users: [user2])
    course3 = Course.create!(name: 'Course 3', users: [user1, user2])

    course3.courses_users
      .find_by!(user: user2)
      .update!(rating: 5)
  }

  it 'allows viewing and rating courses' do
    visit root_path

    fill_in 'Email', with: 'person1@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'

    within('ul') do
      expect(page).to have_content 'Course 1'
      expect(page).to have_content 'Course 3'

      expect(page).not_to have_content 'Course 2'
    end

    click_link 'Course 3'

    select '4', from: 'My Rating'
    click_button 'Save Rating'
    
    expect(find('li', text: 'Course 3')).to have_content 'Rating: 4.5'
  end
end
