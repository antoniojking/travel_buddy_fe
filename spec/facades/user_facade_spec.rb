require 'rails_helper'

RSpec.describe UserFacade do
  it 'can create current user based off of user id' do
    json_response = File.read('spec/fixtures/user/user_info.json')
    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112").to_return(status: 200, body: json_response, headers: {})

    user = UserFacade.current_user_info(3112)

    expect(user.id).to eq('3112')
    expect(user.email).to eq('amee@haag-homenick.net')
    expect(user.current_trips).to be_a(Array)
    expect(user.current_trips.count).to eq(1)
    expect(user.upcoming_trips).to be_a(Array)
    expect(user.upcoming_trips.count).to eq(2)
    expect(user.past_trips).to be_a(Array)
    expect(user.past_trips.count).to eq(1)
    expect(user.friends).to be_a(Array)
    expect(user.friends.count).to eq(1)
  end
end
