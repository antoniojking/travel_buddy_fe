require 'rails_helper'

RSpec.describe CurrentUser do
  it 'exists and has attributes' do
    attributes = {
      id: 3112,
      attributes:
      {email: 'mattdkragen@gmail.com',
      current_trips: [{"id":2064,
        "start_date":"2021-09-11T00:00:00.000Z",
        "end_date":"2021-09-18T00:00:00.000Z",
        "park_code":"grte",
        "name":"Teton National Park",
        "user_id":3112,
        "created_at":"2021-09-21T22:10:11.711Z",
        "updated_at":"2021-09-21T22:10:11.711Z",
        "park_name":"Pamir"}],
      upcoming_trips: [{"id":2065,
        "start_date":"2021-12-18T00:00:00.000Z",
        "end_date":"2021-12-30T00:00:00.000Z",
        "park_code":"grte",
        "name":"Teton National Park",
        "user_id":3112,
        "created_at":"2021-09-21T22:10:11.712Z",
        "updated_at":"2021-09-21T22:10:11.712Z",
        "park_name":"Annapurna Himalaya"},
       {"id":2067,
        "start_date":nil,
        "end_date":nil,
        "park_code":"grte",
        "name":"Teton National Park",
        "user_id":3112,
        "created_at":"2021-09-21T22:10:11.716Z",
        "updated_at":"2021-09-21T22:10:11.716Z",
        "park_name":"Mahalangur Himalaya"}],
        past_trips: [{"id":2066,
          "start_date":"2021-04-18T00:00:00.000Z",
          "end_date":"2021-05-30T00:00:00.000Z",
          "park_code":"grte",
          "name":"Teton National Park",
          "user_id":3112,
          "created_at":"2021-09-21T22:10:11.714Z",
          "updated_at":"2021-09-21T22:10:11.714Z",
          "park_name":"Yengisogat Karakoram"}],
        friends: [{"id":3113,
          "token":"alskjfhadlskjfh9823y489",
          "refresh_token":"2398rcbjwiuf834hf",
          "email":"lezlie@langosh.com",
          "created_at":"2021-09-21T22:10:11.718Z",
          "updated_at":"2021-09-21T22:10:11.718Z",
          "spotify_id":"asljkbadskjfba"}]}
    }

    user = CurrentUser.new(attributes)

    expect(user).to be_an_instance_of(CurrentUser)
    expect(user.id).to eq(attributes[:id])
    expect(user.email).to eq(attributes[:attributes][:email])
    expect(user.current_trips).to eq(attributes[:attributes][:current_trips])
    expect(user.upcoming_trips).to eq(attributes[:attributes][:upcoming_trips])
    expect(user.past_trips).to eq(attributes[:attributes][:past_trips])
    expect(user.friends).to eq(attributes[:attributes][:friends])
  end
end
