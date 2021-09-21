require 'rails_helper'

RSpec.describe 'Explore Page' do
  before :each do
    json_response1 = File.read('spec/fixtures/tb_be_parks_in_co.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state").
      to_return(status: 200, body: json_response1, headers: {})

    json_response2 = File.read('spec/fixtures/tb_be_parks_for_fishing.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?activity").
      to_return(status: 200, body: json_response2, headers: {})
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
    visit explore_index_path

    expect(current_path).to eq(explore_index_path)
    expect(page).to have_content('Find Your Next Destination')

    expect(page).to have_field(:state)
    expect(page).to have_button('Search State')
    expect(page).to have_field(:activity)
    expect(page).to have_button('Search Activity')

    within "#search-results" do
      expect(page).to have_content('Search Results')
      expect(page).to have_content('No Search Results to Display')
    end
  end

  it 'returns a list of links for parks by state upon search' do
    json_response = File.read('spec/fixtures/tb_be_parks_in_co.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state=CO").
      to_return(status: 200, body: json_response, headers: {})
    data = JSON.parse(json_response, symbolize_names: true)

    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks/colm").
      to_return(status: 200, body: json_response, headers: {})

    visit explore_index_path

    within "#state-search" do
      select "Colorado", from: :state

      click_button "Search State"
    end

    expect(current_path).to eq(explore_index_path)

    within "#search-results" do
      expect(page).to have_link("Bent's Old Fort National Historic Site")
      expect(page).to have_link("Colorado National Monument")
      expect(page).to have_link("Florissant Fossil Beds National Monument")

      click_link('Colorado National Monument')

      expect(current_path).to eq("/parks/#{data[:data][3][:id]}")
    end
  end

  it 'returns a list of links for parks by activity upon search' do
    json_response = File.read('spec/fixtures/tb_be_parks_for_fishing.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?activity=fishing").
      to_return(status: 200, body: json_response, headers: {})
    data = JSON.parse(json_response, symbolize_names: true)

    json_response3 = File.read("spec/fixtures/tb_be_park_acad.json")
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks/acad").
      to_return(status: 200, body: json_response3, headers: {})

    visit explore_index_path

    within "#activity-search" do
      fill_in :activity, with: "fishing"

      click_on 'Search Activity'
    end

    expect(current_path).to eq(explore_index_path)

    within "#search-results" do
      expect(page).to have_link('Acadia National Park')
      expect(page).to have_link('Alagnak Wild River')
      expect(page).to have_link('Ala Kahakai National Historic Trail')

      click_link('Acadia National Park')

      expect(current_path).to eq("/parks/#{data[:data][0][:id]}")
    end
  end
end
