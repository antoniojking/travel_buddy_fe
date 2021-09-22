require 'rails_helper'

RSpec.describe Accommodation do
  it 'exists and has attributes' do
    attributes = {
      id: 21,
      attributes:
        {name: 'Jenny Lake Campground',
        location: 'Teton Park Rd, Moose, WY 83012',
        details: 'We will be staying at Jenny Lake site 15 from 11/18 to 11/25.'}
    }

    accommodation = Accommodation.new(attributes)

    expect(accommodation).to be_an_instance_of(Accommodation)
    expect(accommodation.id).to eq(attributes[:id])
    expect(accommodation.name).to eq(attributes[:attributes][:name])
    expect(accommodation.location).to eq(attributes[:attributes][:location])
    expect(accommodation.details).to eq(attributes[:attributes][:details])
  end
end
