require 'rails_helper'

RSpec.describe Accommodation do
  it 'exists and has attributes' do
    attributes = {
      name: 'Jenny Lake Campground',
      location: 'Teton Park Rd, Moose, WY 83012',
      description: 'We will be staying at Jenny Lake site 15 from 11/18 to 11/25.'
    }

    accommodation = Accommodation.new(attributes)

    expect(accommodation).to be_an_instance_of(Accommodation)
    expect(accommodation.name).to eq(attributes[:name])
    expect(accommodation.location).to eq(attributes[:location])
    expect(accommodation.description).to eq(attributes[:description])
  end
end
