require "rails_helper"

RSpec.describe Park do
  before :each do
    json_response = File.read('spec/fixtures/list_of_national_parks.json')
    stub_request(:get, "https://developer.nps.gov/api/v1/parks?limit=465").
    with(
      headers: {
        'X-Api-Key'=>ENV['nps_api_key']
        }).
        to_return(status: 200, body: json_response)
  end

  let(:attrs) { NationalParkService.all_parks[:data].first }
  let(:park) { Park.new(attrs) }

  it "exists" do
    expect(park).to be_a Park
    expect(park.id).to eq(attrs[:id])
    expect(park.name).to eq(attrs[:fullName])
    expect(park.website).to eq(attrs[:url])
    expect(park.description).to eq(attrs[:description])
    expect(park.state).to eq(attrs[:states])
    expect(park.image).to eq(attrs[:images][0][:url])
  end
end
