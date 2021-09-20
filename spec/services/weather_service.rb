require 'rails_helper'

RSpec.describe 'checklist service' do
  it 'returns weather for given amount of days
  ' do
    json_response = File.read('spec/fixtures/weather.json')

    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/weather?days=2&location=Estes%20Park").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.8.0'
      }).

    to_return(status: 200, body: json_response)

    weather = WeatherService.get_weather("Estes Park", 2)

    expect(weather).to be_a Hash
    expect(weather[:data]).to be_an Hash
    expect(weather[:data][:attributes]).to have_key :forecast
    expect(weather[:data][:attributes][:forecast]).to be_an Array
    expect(weather[:data][:attributes][:forecast].count).to eq(2)
  end
end