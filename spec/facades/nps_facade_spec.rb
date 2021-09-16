require 'rails_helper'

RSpec.describe NationalParkFacade do
  describe "class methods" do
    describe ".all_parks" do
      it "returns an array of all the parks as park objects" do
        parks = NationalParkFacade.all_parks

        expect(parks).to be_an Array
        expect(parks.first).to be_a Park
        expect(parks.size).to eq(465)
      end
    end
  end
end