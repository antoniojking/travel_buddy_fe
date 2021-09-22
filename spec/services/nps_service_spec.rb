require 'rails_helper'

describe NationalParkService do
  context "class methods" do
    # context ".all_parks" do
    #   it "returns list of all parks" do
    #     json_response = File.read('spec/fixtures/list_of_national_parks.json')
    #     stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?limit=465").
    #       to_return(status: 200, body: json_response, headers: {})
    #
    #     parks = NationalParkService.all_parks
    #     expect(parks).to be_a Hash
    #     expect(parks[:data]).to be_an Array
    #     expect(parks[:data].size).to eq(3)
    #
    #     park_data = parks[:data].first
    #     expect(park_data).to have_key :id
    #     expect(park_data[:id]).to be_an(String)
    #
    #     expect(park_data).to have_key :url
    #     expect(park_data[:url]).to be_an(String)
    #
    #     expect(park_data).to have_key :fullName
    #     expect(park_data[:fullName]).to be_a(String)
    #
    #     expect(park_data).to have_key :images
    #     expect(park_data[:images]).to be_an(Array)
    #   end
    # end

    context ".parks_by_state" do
      it "returns list of all parks in a state" do
        json_response = File.read("spec/fixtures/tb_be_parks_in_co.json")
        stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?state=CO").
         to_return(status: 200, body: json_response, headers: {})

        parks = NationalParkService.parks_by_state("CO")
        expect(parks).to be_a(Hash)
        expect(parks[:data]).to be_an(Array)
        expect(parks[:data].size).to eq(16)

        park_data = parks[:data].first
        expect(park_data).to have_key :id
        expect(park_data[:id]).to be_a(String)

        expect(park_data).to have_key :type
        expect(park_data[:type]).to be_a(String)

        expect(park_data).to have_key :attributes
        expect(park_data[:attributes]).to be_a(Hash)

        attrs = park_data[:attributes]
        expect(attrs).to have_key :name
        expect(attrs[:name]).to be_a(String)

        expect(attrs).to have_key :description
        expect(attrs[:description]).to be_a(String)

        expect(attrs).to have_key :contacts
        expect(attrs[:contacts][:phoneNumbers][0][:phoneNumber]).to be_a(String)

        expect(attrs).to have_key :directions
        expect(attrs[:directions]).to be_an(String)

        expect(attrs).to have_key :operating_hours
        expect(attrs[:operating_hours][0][:standardHours]).to be_a(Hash)

        expect(attrs).to have_key :images
        expect(attrs[:images][0][:url]).to be_a(String)
      end
    end

    context ".parks_by_activity" do
      it "returns list of all parks eith specified activity" do
        json_response = File.read('spec/fixtures/tb_be_parks_for_fishing.json')
        stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?activity=fishing").
          to_return(status: 200, body: json_response, headers: {})

        parks = NationalParkService.parks_by_activity("fishing")
        expect(parks).to be_a Hash
        expect(parks[:data]).to be_an Array
        expect(parks[:data].size).to eq(140)

        park_data = parks[:data][0]
        expect(park_data).to have_key :id
        expect(park_data[:id]).to be_an(String)

        expect(park_data).to have_key :type
        expect(park_data[:type]).to be_an(String)

        expect(park_data).to have_key :attributes
        expect(park_data[:attributes]).to be_an(Hash)

        attrs = park_data[:attributes]
        expect(attrs).to have_key :name
        expect(attrs[:name]).to be_a(String)
      end
    end

    context ".conn" do
      it "establishes connection with api service" do
        conn = NationalParkService.conn
        expect(conn).to be_a Faraday::Connection
        # expect(conn.headers.keys).to include('X-Api-Key')
        # expect(conn.headers['X-Api-Key']).to eq(ENV['nps_api_key'])
      end
    end
  end
end
