require "rails_helper"

RSpec.describe Park do
  let(:attrs) { NationalParkService.parks_by_state[:data].first }
  let(:park) { ParkByState.new(attrs) }

  xit "exists" do
    expect(park).to be_a ParkByState
    expect(park.id).to eq(attrs[:id])
    expect(park.fullName).to eq(attrs[:fullName])
    expect(park.url).to eq(attrs[:url])
    expect(park.description).to eq(attrs[:description])
  end
end
