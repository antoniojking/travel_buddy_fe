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
  end 
end 