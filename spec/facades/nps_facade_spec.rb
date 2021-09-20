require 'rails_helper'

RSpec.describe NationalParkFacade do
  before :each do
    json_response = File.read('spec/fixtures/list_of_national_parks.json')
    stub_request(:get, "https://developer.nps.gov/api/v1/parks?limit=465").
      with(
           headers: {
          'X-Api-Key'=>ENV['nps_api_key']}).
      to_return(status: 200, body: json_response)
  end

  describe "class methods" do
    describe ".all_parks" do
      it "returns an array of all the parks as park objects" do
        parks = NationalParkFacade.all_parks

        expect(parks).to be_an Array
        expect(parks.first).to be_a Park
        expect(parks.size).to eq(3)
      end
    end

    describe ".parks_by_state" do
      xit "returns an array of all parks in a as park objects" do
        parks = NationalParkFacade.new.parks_by_state(CO)

        expect(parks).to be_an Array
        expect(parks.first).to be_a ParkByState
        expect(parks.size).to eq(16)
      end
    end
  end
end
