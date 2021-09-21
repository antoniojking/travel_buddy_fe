require 'rails_helper'

RSpec.describe 'accommodation show page' do
  before :each do
    json_response = File.read('spec/fixtures/accommodations/single_accommodation.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/39/accommodations/7').to_return(status: 200, body: json_response)

    visit trips_dashboard_accommodation_path(39, 7)
  end

  it "can display an accommodation's attributes" do
    expect(page).to have_content("Belgrade")
    expect(page).to have_content("Location: Rakaposhi")
    expect(page).to have_content("Details: Whiteboards are white because Chuck Norris scared them that way.")
  end

  it 'displays a button to edit the accommodation'do
    expect(page).to have_button('Edit Accommodation')
  end

  it 'displays a button to delete the accommodation' do
    expect(page).to have_button('Delete Accommodation')
  end
end
