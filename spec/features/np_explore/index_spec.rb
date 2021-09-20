require 'rails_helper'

RSpec.describe 'Explore Page' do
  before :each do
    json_response = File.read('spec/fixtures/list_of_national_parks.json')
    stub_request(:get, "https://developer.nps.gov/api/v1/parks?limit=465").
      with(
           headers: {
          'X-Api-Key'=>ENV['nps_api_key']}).
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
      # expect(page).to have_content('State')
      expect(page).to have_link('Acadia National Park')
      # expect(page).to have_content('State')
      expect(page).to have_link('Adams National Historical Park')
      # expect(page).to have_content('State')
    end
  end

# (filter by state or activity)
  xit 'has a drop down menu' do
    within "#option1" do
      select "Colorado", :from => "state"

      click_button "Search State"

      expect(current_path).to eq(explore_index_path)
    end
    expect(page).to have_link("Bent's Old Fort National Historic Site")
    expect(page).to have_link('Colorado National Monument')
    expect(page).to have_link('Florissant Fossil Beds National Monument')
  end

  it 'has a search for activities form' do
    within "#option1" do
      fill_in :activity, with: "squirrels"

      click_on 'Search'
      expect(current_path).to eq(explore_index_path)
    end
  end
end
