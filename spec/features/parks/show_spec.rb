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

      expect(page).to have_button("Create a New Trip to This Park")
      expect(current_path).to eq(trip_dashboard_path())
    end
  end
end