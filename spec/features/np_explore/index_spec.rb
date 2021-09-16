require 'rails_helper'

RSpec.describe 'Explore Page' do 
  before :each do 
    visit explore_index_path
  end

  it 'is on the right page' do 
    expect(current_path).to eq(explore_index_path)
  end 
# testing option 1( filter by state or activity)
  it 'has a drop down menu' do 
    within "#option1" do
      select "Colorado", :from => "state"

      click_button "Search State"
  
      expect(current_path).to eq(explore_index_path)
    end
    expect(page).to have_content('NP Explore Page')
  end

  it 'has a search for activities form' do
    within "#option1" do
      fill_in :activity, with: "squirrels"

      click_on 'Search' 
      expect(current_path).to eq(explore_index_path)
    end
   
  end
# testing option 2(using multiple params)
  it 'can add multiple params to url' do
    within "#option2" do 
      select "Colorado", :from => "state"
      select "Hiking", :from => "activity"


      click_on 'Filter Results' 
      expect(current_path).to eq(explore_index_path)
      expect(page).to have_content("Searching in: CO, with activity Hiking")
    end
  end
end