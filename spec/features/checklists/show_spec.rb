require 'rails_helper'

RSpec.describe "Checklist show page" do
  describe 'display' do
    before :each do
      json_response = File.read('spec/fixtures/checklist_show.json')
      @trip_id = 8
      @checklist_id = 2
  
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}").
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
         to_return(status: 200, body: @json_response)
      
      visit "/trips/dashboard/#{@trip_id}/checklist/#{@checklist_id}"
    end

    it 'can edit item names from list' do
      updated_json_response = File.read('spec/fixtures/updated_checklist_show.json')
      
      stub_request(:patch, "https://travel-buddy-api.herokuapp.com/api/v1/trips/8/checklists/2/checklist_items/1").
         with(body: {"item_id"=>"1", "name"=>"Cheese Doodles"}).
            to_return(status: 200, body: updated_json_response)

      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}").
         to_return(status: 200, body: updated_json_response)

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
         to_return(status: 200, body: empty_checklist_show)
      
      within("#items") do
        click_on "Delete Item"
      end
    end
  end
end