require 'rails_helper'

describe TripService do
  context "class methods" do
    context "::new_trip" do
      it 'can create a new trip' do
        json_response = File.read('spec/fixtures/new_trip.json')
        stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/trips?park_code=romo&park_name=RockyMountian&user_id=7").


          to_return(status: 201, body: json_response)

        headers = {"CONTENT_TYPE" => "application/json"}


        trip = TripService.new_trip("romo", "RockyMountian", 7)

        expect(trip).to be_a Hash

        expect(trip[:data][:attributes]).to have_key(:user_id)
        expect(trip[:data][:attributes][:user_id]).to be_a(Integer)

        expect(trip[:data][:attributes]).to have_key(:park_code)
        expect(trip[:data][:attributes][:park_code]).to be_a(String)

        expect(trip[:data][:attributes]).to have_key(:park_name)
        expect(trip[:data][:attributes][:park_name]).to be_a(String)
      end
    end

    context '::get_trip_details' do
      it 'can get a trips details' do
        json_response = File.read('spec/fixtures/trip_details.json')
        stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/7").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

        trip = TripService.get_trip_details(7)

        expect(trip).to be_a Hash
        expect(trip).to have_key(:data)

        expect(trip[:data][:attributes]).to have_key(:name)
        expect(trip[:data][:attributes][:name]).to be_a(String)

        expect(trip[:data][:attributes]).to have_key(:park_code)
        expect(trip[:data][:attributes][:park_code]).to be_a(String)

        expect(trip[:data][:attributes]).to have_key(:user_id)
        expect(trip[:data][:attributes][:user_id]).to be_a(Integer)

        expect(trip[:data][:attributes][:travel_buddies][0]).to have_key(:id)
        expect(trip[:data][:attributes][:travel_buddies][0][:id]).to be_a(Integer)
      end
    end

    it 'can update trip info' do
      stub_request(:patch, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6?name=Graduation Trip").to_return(status: 200)

      update_info  = {name: "Graduation Trip"}

      trip = TripService.patch_trip(6, update_info)

      expect(trip.status).to eq(200)
    end
  end
end
