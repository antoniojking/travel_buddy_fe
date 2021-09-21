require 'rails_helper'

RSpec.describe 'Explore Page' do
  before :each do
    json_response = File.read('spec/fixtures/tb_be_parks_in_co.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state").
      to_return(status: 200, body: json_response, headers: {})
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

  it 'is on the right page and has attributes' do
    json_response = File.read('spec/fixtures/tb_be_parks_in_co.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state").
      to_return(status: 200, body: json_response, headers: {})

    visit explore_index_path

    expect(current_path).to eq(explore_index_path)
    expect(page).to have_content('Find Your Next Destination')

    expect(page).to have_field(:state)
    expect(page).to have_button('Search State')
    expect(page).to have_field(:activity)
    expect(page).to have_button('Search Activity')

    expect(page).to have_content('Search Results')

    # within "#parks" do
    #   expect(page).to have_content('Search Results')

      # expect(page).to have_link('Abraham Lincoln Birthplace National Historical Park')
      # expect(page).to have_content('State')
      # expect(page).to have_link('Acadia National Park')
      # expect(page).to have_content('State')
      # expect(page).to have_link('Adams National Historical Park')
      # expect(page).to have_content('State')
    # end
  end

  it 'has a drop down menu' do
    json_response = File.read('spec/fixtures/tb_be_parks_in_co.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state=CO").
      to_return(status: 200, body: json_response, headers: {})

    visit explore_index_path

    within "#state-search" do
      select "Colorado", from: :state

      click_button "Search State"
    end

    expect(current_path).to eq(explore_index_path)
    expect(page).to have_link("Bent's Old Fort National Historic Site")
    expect(page).to have_link('Colorado National Monument')
    expect(page).to have_link('Florissant Fossil Beds National Monument')
  end

  xit 'has a search for activities form' do
    within "#activity-search" do
      fill_in :activity, with: "squirrels"

      click_on 'Search'
      expect(current_path).to eq(explore_index_path)
    end
  end
end
