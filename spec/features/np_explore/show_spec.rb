require 'rails_helper' 

RSpec.describe 'Show Page' do
  before :each do
    visit explore_path(420)

  end
  
  it 'is on the right page' do 
    expect(current_path).to eq(explore_path(420))
  end 

  it 'displays park attributes' do
    expect(page).to have_content("Park Name")
    expect(page).to have_content("Activities")
    expect(page).to have_content("Accommodations")
    expect(page).to have_content("Description")
    expect(page).to have_content("State")
    expect(page).to have_content("Entry Fee")
  end 

  it 'has a link to create a new trip to that park' do 
    expect(page).to have_content("Create a New Trip to This Park")
  end 
end