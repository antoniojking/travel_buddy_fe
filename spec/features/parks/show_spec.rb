require 'rails_helper'

RSpec.describe "Park show page" do
  describe 'information display' do
    it 'displays information about a single park' do
      json_response = File.read('spec/fixtures/single_park.json')
      park_code = 'romo'
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks/#{park_code}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: json_response)

      visit "https://travel-buddy-turing.herokuapp.com/parks/#{park_code}"
      # expect(page).to have_content('Park Show Page')

      expect(page).to have_content("Rocky Mountain National Park")
      expect(page).to have_content("Description: Rocky Mountain National Park’s 415 square miles")
      expect(page).to have_content("Phone: 9705861206")
      expect(page).to have_content("Directions: Driving from the east: from I-25, take US Hwy 34 or 36")
      expect(page).to have_content("Wednesday: All Day")
      expect(page).to have_content("Saturday: All Day")
      expect(page).to have_content('States: CO')
      expect(page).to have_xpath("//img[@src='https://www.nps.gov/common/uploads/structured_data/3C7ECCCF-1DD8-B71B-0B4CB4FB1834BC1D.jpg']")
    end

    it 'can create a new trip using button' do
      user_fixture = File.read('spec/fixtures/trips/dashboard/trip_current_user.json')
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112").
        to_return(status: 200, body: user_fixture, headers: {})

      user = UserFacade.current_user_info(3112)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      friends_response = File.read('spec/fixtures/trips/dashboard/current_user_friends.json')
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112/friendships").
        to_return(status: 200, body: friends_response)
        
      json_response = File.read('spec/fixtures/single_park.json')
      park_code = 'romo'
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/parks/#{park_code}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: json_response)

      new_json_response = File.read('spec/fixtures/new_trip.json')
      stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/trips?park_code=romo&park_name=Rocky%20Mountain%20National%20Park&user_id").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Length'=>'0',
        'User-Agent'=>'Faraday v1.8.0'
          }).
        to_return(status: 200, body: new_json_response)

      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/11").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.8.0'
          }).
        to_return(status: 200, body: new_json_response)

      visit "https://travel-buddy-turing.herokuapp.com/parks/#{park_code}"

      expect(page).to have_button("Create A Trip To This Park!")

      click_button "Create A Trip To This Park!"

      expect(current_path).to eq(trips_dashboard_path(11))
    end
  end
end
