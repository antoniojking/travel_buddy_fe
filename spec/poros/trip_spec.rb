require "rails_helper"

RSpec.describe Trip do
  describe "object creation" do 
    before :each do
      json_response = File.read('spec/fixtures/trip_details.json')
        stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/7").
          with(
            headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
            }).
          to_return(status: 200, body: json_response, headers: {})
      
      @trip = TripFacade.trip_details(7)
    end

    it 'exists and has attributes' do
      expect(@trip).to be_a Trip

      expect(@trip.travel_buddies).to be_an Array
      expect(@trip.travel_buddies.count).to eq(1)
      expect(@trip.travel_buddies[0][:id]).to be_an Integer


      expect(@trip.name).to be_a String
      expect(@trip.park_code).to be_a String
      expect(@trip.park_name).to be_a String
    end 
  end 
end