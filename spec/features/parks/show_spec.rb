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
      expect(page).to have_content('Park Show Page')

      
    end
  end
end