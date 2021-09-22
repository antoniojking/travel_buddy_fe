require 'rails_helper'

RSpec.describe 'accommodation edit page' do
  before :each do
    json_response_1 = File.read('spec/fixtures/accommodations/single_accommodation.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: json_response_1)

    json_response_2 = File.read('spec/fixtures/accommodations/update_accommodation.json')
    stub_request(:patch, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7?name=Yosemite Lodge&location=Mount Everest&details=Chuck Norris doesnt need an OS.').to_return(status: 200, body: json_response_2)

    visit trips_dashboard_accommodation_path(6, 7)
  end

  it 'can defaults to current accommodations value' do
    click_button 'Edit Accommodation'

    expect(current_path).to eq(edit_trips_dashboard_accommodation_path(6,7))

    name = 'Belgrade'
    location = 'Rakaposhi'
    details = 'Whiteboards are white because Chuck Norris scared them that way.'

    find_field('Name', with: name).value
    find_field('Location', with: location).value
    find_field('Details', with: details).value
  end

  it 'can edit the accommodation' do
    name = 'Yosemite Lodge'
    location = 'Mount Everest'
    details = 'Chuck Norris doesnt need an OS.'

    click_button 'Edit Accommodation'

    expect(current_path).to eq(edit_trips_dashboard_accommodation_path(6,7))

    fill_in(:name, with:(name))
    fill_in(:location, with:(location))
    fill_in(:details, with:(details))

    json_response_3 = File.read('spec/fixtures/accommodations/update_accommodation.json')
    stub_request(:get, 'https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/7').to_return(status: 200, body: json_response_3)

    click_button('Update Accommodation')

    expect(current_path).to eq(trips_dashboard_accommodation_path(6, 7))

    expect(page).to have_content("Yosemite Lodge")
    expect(page).to have_content("Location: Mount Everest")
    expect(page).to have_content("Details: Chuck Norris doesnt need an OS.")
  end
end
