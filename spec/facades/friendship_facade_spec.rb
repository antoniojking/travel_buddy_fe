require 'rails_helper'

 RSpec.describe FriendshipFacade do
   it 'can call on the friendship service to create a friendship' do
     json_response = File.read('spec/fixtures/user/user_info.json')

     stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112").to_return(status: 200, body: json_response, headers: {})

     json_response2 = File.read('spec/fixtures/user/friend_info.json')

     stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3113").to_return(status: 200, body: json_response2, headers: {})

     json_response3 = File.read('spec/fixtures/user/friendship.json')
     stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112/friendships?email=friend@friend.com").to_return(status: 200, body: json_response3, headers: {})

     user = UserFacade.current_user_info(3112)
     friend = UserFacade.current_user_info(3113)

     friendship = FriendshipFacade.post_friendship(user.id, friend.email)

     expect(friendship).to have_key(:data)
     expect(friendship[:data]).to have_key(:id)
     expect(friendship[:data].class).to eq(Hash)
     expect(friendship[:data]).to have_key(:attributes)
     expect(friendship[:data][:attributes].class).to eq(Hash)
     expect(friendship[:data][:attributes]).to have_key(:user_id)
     expect(friendship[:data][:attributes][:user_id].class).to eq(Integer)
     expect(friendship[:data][:attributes]).to have_key(:friend_id)
     expect(friendship[:data][:attributes][:friend_id].class).to eq(Integer)
   end
 end
