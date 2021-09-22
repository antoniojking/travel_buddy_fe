require 'rails_helper'

RSpec.describe 'accommodation new page' do
  before :each do
    json_response = File.read('spec/fixtures/accommodations/create_accommodation.json')
    stub_request(:post, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations?name=Camp 4&location=Yosemite Valley&details=Pitch your test behind the large boulder').to_return(status: 200, body: json_response)

    @name = 'Camp 4'
    @location = 'Yosemite Valley'
    @details = 'Pitch your test behind the large boulder'

    visit new_trips_dashboard_accommodation_path(6)
  end

  it 'can create new accommodation for trip' do
    json_response_2 = File.read('spec/fixtures/trips/dashboard/trip_accommodation_new.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6').to_return(status: 200, body: json_response_2)

    fill_in 'Name', with: @name
    fill_in 'Location', with: @location
    fill_in 'Details', with: @details
    click_button 'Create Accommodation'

    expect(current_path).to eq(trips_dashboard_path(6))
  end
end
