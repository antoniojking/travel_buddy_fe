require "rails_helper"

RSpec.describe Park do
  let(:attrs) { NationalParkService.all_parks[:data].first }
  let(:park) { Park.new(attrs) }

  it "exists" do
    expect(park).to be_a Park
    expect(park.id).to eq(attrs[:id])
    expect(park.fullName).to eq(attrs[:fullName])
    expect(park.url).to eq(attrs[:url])
    expect(park.description).to eq(attrs[:description])
    expect(park.images).to eq(attrs[:images])

    expect(park.images).to be_an Array
  end
end
