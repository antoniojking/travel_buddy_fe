require 'rails_helper'

RSpec.describe 'checklist service' do
  it 'returns weather for given amount of days' do
    json_response = File.read('spec/fixtures/weather.json')

    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/weather?lat=1258712&lon=267982348793").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.8.0'
      }).
       

    to_return(status: 200, body: json_response)

    weather = WeatherService.get_weather(1258712, 267982348793)

    expect(weather).to be_a Hash
    expect(weather[:data]).to be_a Hash
    expect(weather[:data][:attributes]).to have_key :current_temp
    expect(weather[:data][:attributes][:current_temp]).to be_a Float

    expect(weather[:data][:attributes]).to have_key :min_temp
    expect(weather[:data][:attributes][:min_temp]).to be_a Float

    expect(weather[:data][:attributes]).to have_key :max_temp
    expect(weather[:data][:attributes][:max_temp]).to be_a Float
  end
end