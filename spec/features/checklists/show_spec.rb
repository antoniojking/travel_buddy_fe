require 'rails_helper'

RSpec.describe "Checklist show page" do
  describe 'display' do
    before :each do
      json_response = File.read('spec/fixtures/checklist_show.json')
      @trip_id = 8
      @checklist_id = 2
  
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: json_response)
  
      visit "/trips/dashboard/#{@trip_id}/checklist/#{@checklist_id}"
    end

    it 'shows checklist for a specific trip' do
      expect(page).to have_content("Category: Snacks")
    end
    
    it 'displays fields with current item names on checklist' do
      expect(page).to have_field(:name, with: 'Cheez-its')
    end
  end

  describe 'features' do
    before :each do
      @json_response = File.read('spec/fixtures/checklist_show.json')
      @trip_id = 8
      @checklist_id = 2
      @item_id = 1
      
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: @json_response)
      
      visit "/trips/dashboard/#{@trip_id}/checklist/#{@checklist_id}"
    end

    it 'can edit item names from list' do
      updated_json_response = File.read('spec/fixtures/updated_checklist_show.json')
      
      stub_request(:patch, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}/checklist_items/#{@item_id}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 204, body: updated_json_response)

      within("#items") do
        element = find_field(:name, with: 'Cheez-its')
        element.fill_in with: "Cheese Doodles"
        click_on "Edit Name"
      end

      expect(current_path).to eq("/trips/dashboard/#{@trip_id}/checklist/#{@checklist_id}")
      expect(page).to have_field(:name, with: 'Cheese Doodles')
    end

    it 'can delete items from checklist' do
      empty_checklist_show = File.read('spec/fixtures/empty_checklist_show.json')

      stub_request(:delete, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}/checklist_items/#{@item_id}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: empty_checklist_show)
      
      within("#items") do
        click_on "Delete Item"
      end
    end
  end
end