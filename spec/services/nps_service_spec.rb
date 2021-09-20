require 'rails_helper'

describe NationalParkService do
  context "class methods" do
    context ".all_parks" do
      it "returns list of all parks" do
        json_response = File.read('spec/fixtures/list_of_national_parks.json')
        stub_request(:get, "https://developer.nps.gov/api/v1/parks?limit=465").
         with(
           headers: {
          'X-Api-Key'=>ENV['nps_api_key']
           }).
         to_return(status: 200, body: json_response)

        parks = NationalParkService.all_parks
        expect(parks).to be_a Hash
        expect(parks[:data]).to be_an Array
        expect(parks[:data].size).to eq(3)

        park_data = parks[:data].first
        expect(park_data).to have_key :id
        expect(park_data[:id]).to be_an(String)

        expect(park_data).to have_key :url
        expect(park_data[:url]).to be_an(String)

        expect(park_data).to have_key :fullName
        expect(park_data[:fullName]).to be_a(String)

        expect(park_data).to have_key :images
        expect(park_data[:images]).to be_an(Array)
      end
    end

    xcontext ".parks_by_state" do
      it "returns list of all parks in a state" do
        parks = NationalParkService.parks_by_state("CO")
        expect(parks).to be_a Hash
        expect(parks[:data]).to be_an Array
        expect(parks[:data].size).to eq(16)

        park_data = parks[:data].first
        expect(park_data).to have_key :id
        expect(park_data[:id]).to be_an(String)

        expect(park_data).to have_key :url
        expect(park_data[:url]).to be_an(String)

        expect(park_data).to have_key :fullName
        expect(park_data[:fullName]).to be_a(String)

        expect(park_data).to have_key :description
        expect(park_data[:images]).to be_an(String)
      end
    end

    xcontext ".parks_by_activity" do
      it "returns list of all parks eith specified activity" do
        parks = NationalParkService.parks_by_activity("dog sledding")
        expect(parks).to be_a Hash
        expect(parks[:data]).to be_an Array
        expect(parks[:data].size).to eq(1)
        expect(parks[:data][:parks]).to be_an Array
        expect(parks[:data][:parks]).to eq(4)

        park_data = parks[:data][:parks].first
        expect(park_data).to have_key :states
        expect(park_data[:id]).to be_an(String)

        expect(park_data).to have_key :parkCode
        expect(park_data[:url]).to be_an(String)

        expect(park_data).to have_key :fullname
        expect(park_data[:fullName]).to be_a(String)
      end
    end

    context ".conn" do
      it "establishes connection with api service" do
        conn = NationalParkService.conn
        expect(conn).to be_a Faraday::Connection
        expect(conn.headers.keys).to include('X-Api-Key')
        expect(conn.headers['X-Api-Key']).to eq(ENV['nps_api_key'])
      end
    end
  end
end
