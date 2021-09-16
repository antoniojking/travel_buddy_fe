require 'rails_helper'

RSpec.describe 'Explore Page' do 
  before :each do 
    visit explore_index_path
  end
  it 'is on the right page' do 
    
    expect(current_path).to eq(explore_index_path)
  end 

  it 'has a drop down menu' do 
    select "Colorado", :from => "state"

    click_button "Search State"

    expect(current_path).to eq(explore_index_path)
    expect(page).to have_content('NP Explore Page')

  end

  it 'has a search for activities form' do
    fill_in :activity, with: "squirrels"

    click_on 'Search' 
    expect(current_path).to eq(explore_index_path)
  end
end