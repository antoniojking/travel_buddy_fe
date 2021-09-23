require 'rails_helper'

RSpec.describe TripFacade do
  context 'class methods' do
    context '::trip_details' do
      it 'gets a trips details from the database' do\
        json_response = File.read('spec/fixtures/trip_details.json')
        stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/7").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
          }).
          to_return(status: 200, body: json_response, headers: {})

          trip = TripFacade.trip_details(7)

          expect(trip).to be_a Trip
      end
    end

    context '::new_trip' do
      it 'can create a new trip' do
        json_response = File.read('spec/fixtures/new_trip.json')
        stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/trips?park_code=romo&park_name=RockyMountian&user_id=7").

          to_return(status: 201, body: json_response)

        headers = {"CONTENT_TYPE" => "application/json"}


        trip = TripFacade.new_trip("romo", "RockyMountian", 7)
        expect(trip).to be_a Trip
      end
    end

    context '::update_trip' do
      it 'can update trip attributes' do
        json_response = File.read('spec/fixtures/trips/dashboard/trip_update_name.json')
        stub_request(:patch, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6?name=Graduation Trip").to_return(status: 200, body: json_response)

        update_info  = {name: "Graduation Trip"}

        trip = TripFacade.update_trip(6, update_info)

        expect(trip.status).to eq(200)
      end
    end
  end
end
