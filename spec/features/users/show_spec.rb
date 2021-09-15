require 'rails_helper'

RSpec.describe 'User dashboard page' do
  describe 'as an authenticated user' do
    # let(:email) { 'funbucket13' }
    # let(:password) { 'test' }
    # let(:user) { User.create(email: email, password: password) }

    # before do
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # end

    describe 'when I visit the "/user_dashboard" path' do
      before { visit '/user_dashboard' }

      it 'displays welcome message and section headers' do
        save_and_open_page
        expect(current_path).to eq('/user_dashboard')
        expect(page).to have_content("Welcome User!")
      end

      it 'displays a link to read trip notifications/messages' do
        expect(page).to have_link("Notifications")
      end

      # context 'when I click on the notifications link' do
      #   before { click_link('Notifications') }
      #
      #   it 'redirects me to the notifications page' do
      #     expect(current_path).to eq('/notifications')
      #   end
      # end

      it 'displays a button to explore national parks' do
        expect(page).to have_button("Explore National Parks")
      end

      # context 'when I click on the explore national parks button' do
      #   before { click_button('Explore National Parks') }
      #
      #   it 'redirects me to the explore page' do
      #     expect(current_path).to eq('/explore')
      #   end
      # end

      it 'displays a current trip section' do
        within "#current_trip" do
          expect(page).to have_content("Current Trip")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays an upcoming trips section' do
        within "#upcoming_trips" do
          expect(page).to have_content("Upcoming Trips")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays a past trips section' do
        within "#past_trips" do
          expect(page).to have_content("Past Trips")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays a travel_buddies section' do
        within "#travel_buddies" do
          expect(page).to have_content("Travel Buddies")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end
    end
  end
end
