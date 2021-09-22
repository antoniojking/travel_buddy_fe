require 'rails_helper'

RSpec.describe "Checklist show page" do
  before :each do
    json_response = File.read('spec/fixtures/checklist_show.json')
    trip_id = 8
    checklist_id = 2

    stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{trip_id}/checklists/#{checklist_id}").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v1.8.0'
         }).
       to_return(status: 200, body: json_response)

    visit "/trips/dashboard/#{trip_id}/checklist/#{checklist_id}"
  end

  describe 'display' do

    it 'shows checklist for a specific trip' do
      expect(page).to have_content("Category: Snacks")
    end
    
    it 'displays checklist items on checklist' do
      expect(page).to have_content("Cheez-its")
      expect(page).to have_content("Jerky")
      expect(page).to have_content("Nuts")
    end
  end

  describe 'features' do
    it 'can edit item names from list' do
  
    end
  end
end