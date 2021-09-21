require 'rails_helper'

RSpec.describe 'accommodation edit page' do
  before :each do
    json_response_1 = File.read('spec/fixtures/trips/dashboard/trip_new.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
    to_return(status: 200, body: json_response_1)

    json_response_2 = File.read('spec/fixtures/accommodations/single_accommodation.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: json_response_2)

    visit trips_dashboard_accommodation_path(6, 7)
  end

  it 'can edit the accommodation' do
    click_button 'Edit Accommodation'

    expect(current_path).to eq(edit_trips_dashboard_accommodation_path(6,7))
  end
end
