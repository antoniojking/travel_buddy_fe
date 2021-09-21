require 'rails_helper'

RSpec.describe UserService do
  it 'can get user info' do
    json_response = File.read('spec/fixtures/user_info.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/39/accommodations').to_return(status: 200, body: json_response)
  end
end
