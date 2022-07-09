require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert_text 'Courses'
    
    click_link 'New course'
    
    fill_in('Name', with: 'Cool course')
    
    click_button('Create course')
    
    assert_text 'Courses'

    within('#courses') do
      assert_text 'Cool course'
    end
  end
end
