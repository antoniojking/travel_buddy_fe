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
    
    it 'displays user email next to item' do
      expect(page).to have_content("Assigned To: email@gmail.com")
    end

    it 'displays buttons' do
      expect(page).to have_button('Volunteer For A New Item')
      expect(page).to have_button('Update/Save Item')
      expect(page).to have_button('Remove Item')
    end
  end

  xdescribe 'features' do
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
         with(body: { "item_id"=>"1", "name"=>"Cheese Doodles" }).
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
      
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}").
         to_return(status: 200, body: empty_checklist_show)
      
      expect(page).to have_field(:name, with: 'Cheez-its')

      within("#items") do
        click_on "Delete Item"
      end

      expect(current_path).to eq("/trips/dashboard/#{@trip_id}/checklist/#{@checklist_id}")
      expect(page).to_not have_field(:name, with: 'Cheez-its')
    end

    it 'can create new item with name as New Item' do
      empty_checklist_show = File.read('spec/fixtures/empty_checklist_show.json')
      new_item_fixture = File.read('spec/fixtures/new_checklist_item.json')
      json_response = File.read('spec/fixtures/user/user_info.json')
      
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/users/3112").to_return(status: 200, body: json_response, headers: {})
      user = UserFacade.current_user_info(3112)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/trips/8/checklists/2/checklist_items?name=New%20Item&user_email=amee@haag-homenick.net&user_id=3112").
         to_return(status: 200)

      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/#{@trip_id}/checklists/#{@checklist_id}").
         to_return(status: 200, body: new_item_fixture)
      
      expect(page).to_not have_field(:name, with: 'New Item')
      click_on "Create New Item"

      expect(current_path).to eq("/trips/dashboard/#{@trip_id}/checklist/#{@checklist_id}")
      expect(page).to have_field(:name, with: 'New Item')
    end
  end
end