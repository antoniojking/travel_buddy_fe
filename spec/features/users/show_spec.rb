require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'dashboard and attributes' do
    it 'exists with attributes' do
      visit user_path

      expect(current_path).to eq(user_path)
      expect(page).to have_content("Welcome User")
      expect(page).to have_content("Current Trip")
      expect(page).to have_content("Upcoming Trips")
      expect(page).to have_content("Past Trips")
      expect(page).to have_content("Travel Buddies")
      expect(page).to have_link("Notifications")
      expect(page).to have_button("Explore National Parks")
    end
  end
end
