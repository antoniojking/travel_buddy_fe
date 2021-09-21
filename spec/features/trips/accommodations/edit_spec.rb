require 'rails_helper'

RSpec.describe 'accommodation edit page' do
  before :each do
    json_response = File.read('spec/fixtures/accommodations/single_accommodation.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/39/accommodations/7').to_return(status: 200, body: json_response)

    visit trips_dashboard_accommodation_path(39, 7)
  end

  it 'can edit the accommodation' do
    click_button 'Edit Accommodation'

    expect(current_path).to eq(edit_trips_dashboard_accommodation_path(39,7))
  end
end
