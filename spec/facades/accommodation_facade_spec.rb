require 'rails_helper'

RSpec.describe AccommodationFacade do
  describe 'accommodation creation' do
    it 'can create accommodations based off of trip id' do
      json_response = File.read('spec/fixtures/accommodations/accommodations_by_trip.json')
      stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/39/accommodations').
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.8.0'
           }).to_return(status: 200, body: "", headers: {})

      accommodations = AccommodationFacade.create_accommodations_for_trip(39)

      expect(accommodations.count).to eq(2)

      accommodations.each do |accommodation|
        expect(accommodation).to be_a(Accommodation)
      end
    end

    it 'can create accommodation based off of trip and accommodation id'

    it 'can create a new accommodation for a trip'

    it ''
  end
end
