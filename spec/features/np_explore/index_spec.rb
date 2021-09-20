require 'rails_helper'

RSpec.describe 'Explore Page' do
  before :each do
    json_response = File.read('spec/fixtures/list_of_national_parks.json')
    stub_request(:get, "https://developer.nps.gov/parks?api_key=69QwAL1uO0Fqbi1w8JgWXdUHrBdCmTxJkelc5Yd3&limit=465").
      to_return(status: 200, body: json_response)

    visit explore_index_path
  end

  # Happy Path
  # As a User, I can visit the explore dashboard.
  # At the top, I see a message, "Find Your Next Destination".
  #
  # Below this, a "Popular National Parks" section.
  #
  # Happy Path
  # The "National Parks" section contains a list of American National Parks. Each element displays:
  # Park name
  # An image of the park
  # State in which the park is located

  it 'is on the right page' do
    expect(current_path).to eq(explore_index_path)
    expect(page).to have_content('Find Your Next Destination')

    within "#parks" do
      expect(page).to have_content('List of National Parks')
      expect(page).to have_link('Abraham Lincoln Birthplace National Historical Park')
      expect(page).to have_link('Acadia National Park')
      expect(page).to have_link('Adams National Historical Park')
    end
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
end
