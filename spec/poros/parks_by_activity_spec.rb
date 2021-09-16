require "rails_helper"

RSpec.describe Park do
  let(:attrs) { NationalParkService.parks_by_activity[:data][:parks].first }
  let(:park) { ParkByActivity.new(attrs) }

  it "exists" do
    expect(park).to be_a ParkByActivity
    expect(park.states).to eq(attrs[:states])
    expect(park.fullName).to eq(attrs[:fullName])
    expect(park.parkcode).to eq(attrs[:parkCode])
    expect(park.url).to eq(attrs[:url])
  end
end
