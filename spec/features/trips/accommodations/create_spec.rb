require 'rails_helper'

RSpec.describe 'accommodation new page' do
  before :each do
    weather_json = File.read('spec/fixtures/weather.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/weather?lat=40.3556924&lon=-105.6972879").
    with(
      headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Faraday v1.8.0'
      }).
    to_return(status: 200, body: weather_json)

    
    park_response = File.read('spec/fixtures/single_park.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks/romo").
        to_return(status: 200, body: park_response)

    user_fixture = File.read('spec/fixtures/trips/dashboard/trip_current_user.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112").
      to_return(status: 200, body: user_fixture, headers: {})

    user = UserFacade.current_user_info(3112)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    friends_response = File.read('spec/fixtures/trips/dashboard/current_user_friends.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112/friendships").
      to_return(status: 200, body: friends_response)

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
