require 'rails_helper'

 RSpec.describe Friend do
   it 'exists and has attributes' do
     attributes = {id: 3,
            type: "User Email",
            attributes: {
                email: "test1@test.com"}}

    friend = Friend.new(attributes)

    expect(friend).to be_an_instance_of(Friend)
    expect(friend.id).to eq(3)
    expect(friend.email).to eq('test1@test.com')
   end
 end
