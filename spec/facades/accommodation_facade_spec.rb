require 'rails_helper'

RSpec.describe AccommodationFacade do
  describe 'accommodation creation' do
    it 'can create accommodations based off of trip id' do
      json_response = File.read('spec/fixtures/accommodations/accommodations_by_trip.json')
      stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations').to_return(status: 200, body: json_response)

      accommodations = AccommodationFacade.create_accommodations_for_trip(6)

      expect(accommodations.count).to eq(2)

      accommodations.each do |accommodation|
        expect(accommodation).to be_a(Accommodation)
      end
    end

    it 'can create accommodation based off of trip and accommodation id' do
      json_response = File.read('spec/fixtures/accommodations/single_accommodation.json')
      stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: json_response)

      accommodation = AccommodationFacade.create_accommodation_by_id(6, 7)

      expect(accommodation.name).to eq('Belgrade')
      expect(accommodation.location).to eq('Rakaposhi')
      expect(accommodation.details).to eq('Whiteboards are white because Chuck Norris scared them that way.')
    end

    it 'can create a new accommodation for a trip' do
      json_response = File.read('spec/fixtures/accommodations/create_accommodation.json')
      stub_request(:post, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations?name=Camp 4&location=Yosemite Valley&details=Pitch your test behind the large boulder').to_return(status: 200, body: json_response)

      name = 'Camp 4'
      location = 'Yosemite Valley'
      details = 'Pitch your test behind the large boulder'

      accommodation = AccommodationFacade.create_new_accommodation(6, name, location, details)

      expect(accommodation.name).to eq('Camp 4')
      expect(accommodation.location).to eq('Yosemite Valley')
      expect(accommodation.details).to eq('Pitch your test behind the large boulder')

    end

    it 'can update an existing accommodation' do
      json_response = File.read('spec/fixtures/accommodations/update_accommodation.json')
      stub_request(:patch, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/12?name=Yosemite Lodge&location=Mount Everest&details=Chuck Norris doesnt need an OS.').to_return(status: 200, body: json_response)

      name = 'Yosemite Lodge'
      location = 'Mount Everest'
      details = 'Chuck Norris doesnt need an OS.'

      accommodation = AccommodationFacade.update_accommodation(6, 12, name, location, details)

      expect(accommodation.name).to eq('Yosemite Lodge')
      expect(accommodation.location).to eq('Mount Everest')
      expect(accommodation.details).to eq('Chuck Norris doesnt need an OS.')
    end

    it 'can destroy an existing accommodation' do
      json_response = File.read('spec/fixtures/accommodations/single_accommodation.json')
      stub_request(:delete, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: "")

      accommodation = AccommodationFacade.delete_accommodation(6, 7)

      expect(accommodation.status).to be(200)
      expect(accommodation.body).to eq("")
    end
  end
end
