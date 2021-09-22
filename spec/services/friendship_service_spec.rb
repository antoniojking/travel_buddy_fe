require 'rails_helper'

 RSpec.describe FriendshipService do
   it 'can make a friendship between two users' do
     friendship = FriendshipService.post_friendship()
   end
 end
