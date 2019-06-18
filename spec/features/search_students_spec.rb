require 'rails_helper'

RSpec.describe 'as a user on the root path' do
  it 'can search students by house' do
    # As a user
    # When I visit "/"
    visit root_path
    # And I select "Slytherin" from the dropdown
    select "Slytherin", :from => "house"
    # And I click on "Get Students"
    click_button 'Get Students'
    # Then my path should be "/search" with "house=slytherin" in the parameters
    expect(current_url).to eq('/search')
    # And I should see a message "22 Students"
    expect(page).to have_content('22 Students')
    # And I should see a list of the 22 members of Slytherin
    within '.students' do
      expect(page).to have_css('.student', count: 22)
      # And I should see a name and id for each student.
      within first '.student' do
        expect(page).to have_css('.id')     
        expect(page).to have_css('.name')       
      end
    end
  end
end
