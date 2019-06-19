require 'rails_helper'

RSpec.describe 'as a user on the root path' do
  it 'can search students by house' do
    visit root_path

    select "Slytherin", :from => "house"

    click_button 'Get Students'
    # Then my path should be "/search" with "house=slytherin" in the parameters
    # What exactly should I be testing here?
    expect(current_url).to eq('http://www.example.com/search?utf8=%E2%9C%93&house=Slytherin&commit=Get+Students')
    expect(current_path).to eq('/search')

    expect(page).to have_content('22 Students')

    within '.students' do
      expect(page).to have_css('.student', count: 22)
      within first '.student' do
        expect(page).to have_content('Name:')     
        expect(page).to have_content('Id:')       
      end
    end
  end
end
