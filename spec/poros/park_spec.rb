require "rails_helper"

RSpec.describe Park do
  it 'exists with attributes' do
    json_response = File.read('spec/fixtures/tb_be_parks_in_co.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state=CO").
         to_return(status: 200, body: json_response, headers: {})
    data = JSON.parse(json_response, symbolize_names: true)[:data].first


    park = NationalParkFacade.parks_by_state('CO').first
    expect(park).to be_a Park
    expect(park.id).to eq(data[:id])
    expect(park.name).to eq(data[:attributes][:name])
    expect(park.description).to eq(data[:attributes][:description])
    expect(park.phone_number).to eq(data[:attributes][:contacts][:phoneNumbers][0][:phoneNumber])
    expect(park.directions).to eq(data[:attributes][:directions])
    expect(park.hours).to eq(data[:attributes][:operating_hours][0][:standardHours])
    expect(park.state).to eq(data[:attributes][:states])
    expect(park.image).to eq(data[:attributes][:images][0][:url])
  end
end
