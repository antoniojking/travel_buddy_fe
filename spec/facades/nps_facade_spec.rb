require 'rails_helper'

RSpec.describe NationalParkFacade do

  describe "class methods" do
    describe ".all_parks" do
      it "returns an array of all the parks as park objects" do
        parks = Na tionalParkFacade.all_parks

        expect(parks).to be_an Array
        expect(parks.first).to be_a Park
        expect(parks.size).to eq(465)
      end
    end

    describe ".parks_by_state" do
      it "returns an array of all parks in a as park objects" do
        parks = NationalParkFacade.new.parks_by_state(CO)

        expect(parks).to be_an Array
        expect(parks.first).to be_a ParkByState
        expect(parks.size).to eq(16)
      end
    end
  end
end
