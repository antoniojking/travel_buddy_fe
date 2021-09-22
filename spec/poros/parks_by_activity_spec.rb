require "rails_helper"

RSpec.describe Park do
  before :each do
    json_response = File.read('spec/fixtures/tb_be_parks_for_fishing.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks?activity=fishing").
      to_return(status: 200, body: json_response, headers: {})
    @data = JSON.parse(json_response, symbolize_names: true)
  end

  it "exists" do
    attrs = @data[:data][0]
    park = ParkByActivity.new(attrs)
    
    expect(park).to be_a ParkByActivity
    expect(park.id).to eq(attrs[:id])
    expect(park.name).to eq(attrs[:attributes][:name])
  end
end
