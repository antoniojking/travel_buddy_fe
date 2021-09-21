require 'rails_helper'

RSpec.describe UserService do
  it 'can get user info' do
    json_response = File.read('spec/fixtures/user/user_info.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/users/4').to_return(status: 200, body: json_response)

    user = UserService.get_user_info(4)

    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:spotify_id)
    expect(user[:data][:attributes]).to have_key(:token)
    expect(user[:data][:attributes]).to have_key(:refresh_token)
    expect(user[:data][:attributes]).to have_key(:trips)
    expect(user[:data][:attributes][:trips]).to be_a(Array)
    expect(user[:data][:attributes]).to have_key(:friends)
    expect(user[:data][:attributes][:friends]).to be_a(Array)

  end
end
