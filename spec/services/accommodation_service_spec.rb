require 'rails_helper'

RSpec.describe AccommodationService do
  it 'can get accommodations based off of trip id' do
    json_response = File.read('spec/fixtures/accommodations/accommodations_by_trip.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations').to_return(status: 200, body: json_response)

    accommodations = AccommodationService.get_trip_accommodations(6)

    expect(accommodations[:data].count).to eq(2)

    accommodations[:data].each do  |accommodation|
      expect(accommodation).to have_key(:id)
      expect(accommodation[:id]).to be_a(String)
      expect(accommodation).to have_key(:type)
      expect(accommodation[:type]).to eq("accommodation")
      expect(accommodation).to have_key(:attributes)
      expect(accommodation[:attributes]).to be_a(Hash)
      expect(accommodation[:attributes]).to have_key(:name)
      expect(accommodation[:attributes]).to have_key(:location)
      expect(accommodation[:attributes]).to have_key(:details)
    end
  end

  it 'can get a single accommodation based off of trip id & accommodation id' do
    json_response = File.read('spec/fixtures/accommodations/single_accommodation.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: json_response)

    accommodation = AccommodationService.get_accommodation(6, 7)

    expect(accommodation[:data]).to be_a(Hash)
    expect(accommodation[:data]).to have_key(:id)
    expect(accommodation[:data]).to have_key(:type)
    expect(accommodation[:data]).to have_key(:attributes)
    expect(accommodation[:data][:attributes]).to be_a(Hash)
    expect(accommodation[:data][:attributes]).to have_key(:name)
    expect(accommodation[:data][:attributes]).to have_key(:location)
    expect(accommodation[:data][:attributes]).to have_key(:details)
  end
  it 'can create'

  it 'can update an existing accommodation with given params' do
    json_response = File.read('spec/fixtures/accommodations/update_accommodation.json')
    stub_request(:patch, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/12?name=Yosemite Lodge&location=Mount Everest&details=Chuck Norris doesnt need an OS.').to_return(status: 200, body: json_response)

    name = 'Yosemite Lodge'
    location = 'Mount Everest'
    details = 'Chuck Norris doesnt need an OS.'

    accommodation = AccommodationService.update_trip_accommodations(6, 12, name, location, details)

    expect(accommodation[:data]).to be_a(Hash)
    expect(accommodation[:data]).to have_key(:id)
    expect(accommodation[:data]).to have_key(:type)
    expect(accommodation[:data]).to have_key(:attributes)
    expect(accommodation[:data][:attributes]).to be_a(Hash)
    expect(accommodation[:data][:attributes]).to have_key(:name)
    expect(accommodation[:data][:attributes]).to have_key(:location)
    expect(accommodation[:data][:attributes]).to have_key(:details)
  end

  it 'can destroyexisting accommodation with given params' do
    json_response = File.read('spec/fixtures/accommodations/single_accommodation.json')
    stub_request(:delete, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: "")

    accommodation = AccommodationService.delete_trip_accommodations(6, 7)

    expect(accommodation.status).to be(200)
    expect(accommodation.body).to eq("")
  end
end
