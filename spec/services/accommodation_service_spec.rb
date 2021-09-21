require 'rails_helper'

RSpec.describe AccommodationService do
  it 'can get accommodations based off of trip id' do
    json_response = File.read('spec/fixtures/accommodations/accommodations_by_trip.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/39/accommodations').to_return(status: 200, body: json_response)

    accommodations = AccommodationService.get_trip_accommodations(39)

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
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/39/accommodations/7').to_return(status: 200, body: json_response)

    accommodation = AccommodationService.get_accommodation(39, 7)

    expect(accommodation[:data]).to be_a(Hash)
    expect(accommodation[:data]).to have_key(:id)
    expect(accommodation[:data]).to have_key(:type)
    expect(accommodation[:data]).to have_key(:attributes)
    expect(accommodation[:data][:attributes]).to be_a(Hash)
    expect(accommodation[:data][:attributes]).to have_key(:name)
    expect(accommodation[:data][:attributes]).to have_key(:location)
    expect(accommodation[:data][:attributes]).to have_key(:details)
  end

  it 'can create a new accommodation with given params' do
    
  end
end
