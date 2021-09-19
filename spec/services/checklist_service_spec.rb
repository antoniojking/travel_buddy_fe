require 'rails_helper'

RSpec.describe 'checklist service' do
  xit 'returns checklist json by trip id' do
    json_response = File.read('spec/fixtures/checklist_by_trip.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/12/checklists").
    to_return(status: 200, body: json_response)

    expect(response)
  end
end
